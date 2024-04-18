// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

import {Event} from "../library/Event.sol";
import {Error} from "../library/Error.sol";

contract ShipmentManagement {

   mapping(address => Shipment[]) public shipments;
   mapping(address => bool) public isAdmin;  // @notice  Mapping to track admin privileges

   uint256 public shipmentCount;
   address owner;


    struct Shipment {
        address sender;
        address receiver;
        uint256 pickupTime;
        uint256 deliveryTime;
        uint256 distance;
        ShipmentStatus status;
        bool isPaid;
    }

    enum ShipmentStatus { PENDING, IN_TRANSIT, DELIVERED }

 

  

    constructor() {
        owner = msg.sender;
    }

     modifier onlyAdmin() {
        if (!isAdmin[msg.sender]) revert ("NOT_AUTHORIZE()");
        _;
    }

       modifier onlyOwner(){
        require(owner == msg.sender, "not authorize");
        _;
    }

    function createShipment(address receiver, uint256 pickupTime, uint256 distance) external onlyAdmin {
        Shipment memory newShipment = Shipment({
            sender: msg.sender,
            receiver: receiver,
            pickupTime: pickupTime,
            deliveryTime: 0,
            distance: distance,
            status: ShipmentStatus.PENDING,
            isPaid: false
        });
        shipments[msg.sender].push(newShipment);
        shipmentCount++;

        emit Event.ShipmentCreated(msg.sender, receiver, pickupTime, distance);
    }

    function startShipment(address sender, uint256 index) external onlyAdmin {
        Shipment storage shipment = shipments[sender][index];
        require(shipment.status == ShipmentStatus.PENDING, "Shipment is not pending");
        shipment.status = ShipmentStatus.IN_TRANSIT;

        emit Event.ShipmentInTransit(sender, shipment.receiver, shipment.pickupTime);
    }

    function completeShipment(address sender, uint256 index) external onlyAdmin {
        Shipment storage shipment = shipments[sender][index];
        require(shipment.status == ShipmentStatus.IN_TRANSIT, "Shipment not in transit");
        shipment.status = ShipmentStatus.DELIVERED;
        shipment.deliveryTime = block.timestamp;

        emit Event.ShipmentDelivered(sender, shipment.receiver, shipment.deliveryTime);
    }

   
    function addAdmin(address _admin) external onlyOwner {
        require(_admin != address(0), "invalid Address zero");
        if (isAdmin[_admin]) revert ("NOT_AUTHORIZE()");
        isAdmin[_admin] = true;
        emit Event.AdminAdded(_admin);
    }

    function getShipment(address sender, uint256 index) external view returns (Shipment memory) {
        return shipments[sender][index];
    }

    function getShipmentCount(address sender) external view returns (uint256) {
        return shipments[sender].length;
    }
}
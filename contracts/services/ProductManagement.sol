// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/AccessControl.sol";
import {Event} from "../library/Event.sol";

contract ProductManagement is AccessControl {


    Product[] public productList;
    mapping(uint => Product) products;
    uint256 public productIdCounter;
    mapping(address => bool) public isAdmin;  // @notice  Mapping to track admin privileges

    address owner;

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    enum ProductStatus { Available, OutOfStock, Discontinued }

    struct Product {
        uint256 id;
        bytes32 productName;
        bytes32 productDescription;
        bytes32 productImage;
        uint256 productQuantity;
        uint256 productPrice;
        ProductStatus status;
    }

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "not authorize");
        _;
    }

    modifier onlyAdmin() {
        if (!isAdmin[msg.sender]) revert ("NOT_AUTHORIZE()");
        _;
    }


    function addProduct(
        bytes32 _productName,
        bytes32 _productDescription,
        bytes32 _productImage,
        uint256 _productQuantity,
        uint256 _productPrice
    ) public onlyAdmin {
        productIdCounter++;
        Product storage _product = products[productIdCounter];
        _product.id = productIdCounter;
        _product.productName = _productName;
        _product.productDescription = _productDescription;
        _product.productImage = _productImage;
        _product.productQuantity = _productQuantity;
        _product.productPrice = _productPrice;
        _product.status = ProductStatus.Available;

        productList.push(_product);
        emit Event.ProductAdded(productIdCounter, _productName);
    }

    function updateProductStatus(uint256 _productId, ProductStatus _status) public onlyAdmin {
        require(_productId > 0 && _productId <= productIdCounter, "Invalid product ID");
        products[_productId - 1].status = _status;
        emit Event.ProductUpdated(_productId,uint8(_status));
    }

    function checkProductAvailability(uint256 _productId, uint256 _quantity) public returns (bool) {
        require(_productId > 0 && _productId <= productList.length, "Invalid product ID");
        bool isAvailable = products[_productId - 1].productQuantity >= _quantity && products[_productId - 1].status == ProductStatus.Available;
        emit Event.ProductAvailabilityChecked(_productId, isAvailable);
        return isAvailable;
    }

    function getAllProducts() public view returns (Product[] memory) {
        return productList;
    }

    function productPrice(uint _id) external view returns(uint) {
        return products[_id].productPrice;
    }

    function addAdmin(address _admin) external onlyOwner {
        require(_admin != address(0), "invalid Address zero");
        if (isAdmin[_admin]) revert ("NOT_AUTHORIZE()");
        isAdmin[_admin] = true;
        emit Event.AdminAdded(_admin);
    }
}




// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

library Event {
    //    enum ProductStatus {
    //     Available,    // @notice Product is currently in stock and available for purchase.
    //     OutofStock,   // @notice Product is currently not available for purchase because it is out of stock.
    //     Backordered,  // @notice Product is out of stock, but more inventory is expected to arrive soon.
    //     Preorder,     // @notice Product is not yet available for immediate purchase, but customers can place pre-orders for it.
    //     OnSale        // @notice Product is currently on sale or available at a discounted price.
    // }



    event ProductAdded(uint256 productId, bytes32 productName);
    event ProductUpdated(uint256 productId, uint8 status);
    event AdminAdded(address newAdmin);
    event ProductAvailabilityChecked(uint productId, bool isAvailable);
      event ShipmentCreated(address indexed sender, address receiver, uint256 pickupTime, uint256 distance);
    event ShipmentInTransit(address indexed sender, address receiver, uint256 pickupTime);
    event ShipmentDelivered(address indexed sender, address receiver, uint256 deliveryTime);
        event PaymentProcessed(address indexed user, uint256 amount);
    event PurchaseCompleted(address indexed user, uint256 amount);
      event CartUpdated(address indexed user, uint256 productId, uint256 quantity);
    event CartCleared(address indexed user);
    event CartItemRemoved(address indexed user, uint256 productId);

}
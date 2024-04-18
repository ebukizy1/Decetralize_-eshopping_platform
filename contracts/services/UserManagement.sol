// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./ProductManagement.sol"; // Assuming this contract handles product-related operations
import {Event} from "../library/Event.sol";


contract UserManagement {
    struct CartItem {
        uint256 productId;
        uint256 quantity;
    }

    struct User {
        address userAddress;
        CartItem[] cart;
    }

    mapping(address => User) public users;
    ProductManagement private productManagement;

  

    constructor(address productManagementAddress) {
        productManagement = ProductManagement(productManagementAddress);
    }

    /**
     * @notice Adds a product to the user's cart.
     * @param productId The ID of the product to add.
     * @param quantity The quantity of the product to add.
     */
    function addProductToCart(uint256 productId, uint256 quantity) public {
        require(quantity > 0, "Quantity must be greater than zero");
        require(productManagement.checkProductAvailability(productId, quantity), "Product not available or insufficient quantity");

        User storage user = users[msg.sender];
        bool found = false;

        for (uint i = 0; i < user.cart.length; i++) {
            if (user.cart[i].productId == productId) {
                user.cart[i].quantity += quantity;
                found = true;
                break;
            }
        }

        if (!found) {
            user.cart.push(CartItem(productId, quantity));
        }

        emit Event.CartUpdated(msg.sender, productId, quantity);
    }

    /**
     * @notice Clears the cart of a user.
     */
    function clearCart(address _user) public {
        delete users[_user].cart;
        emit Event.CartCleared(_user);
    }

    /**
     * @notice Gets the cart items of the calling user.
     * @return An array of cart items.
     */
    function getCartItems() public view returns (CartItem[] memory) {
        return users[msg.sender].cart;
    }

    /**
     * @notice Removes a specific item from the user's cart based on index.
     * @param index The index of the cart item to remove.
     */
    function removeCartItem(uint index) public {
        require(index < users[msg.sender].cart.length, "Index out of bounds");

        emit Event.CartItemRemoved(msg.sender, users[msg.sender].cart[index].productId);

        for (uint i = index; i < users[msg.sender].cart.length - 1; i++) {
            users[msg.sender].cart[i] = users[msg.sender].cart[i + 1];
        }
        users[msg.sender].cart.pop();
    }
}





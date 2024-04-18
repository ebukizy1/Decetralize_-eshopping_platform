

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {UserManagement} from  "./UserManagement.sol";
import {ProductManagement} from  "./ProductManagement.sol";
import {Event} from "../library/Event.sol";



contract PaymentProcessing  {
    IERC20 public emaxToken;
    UserManagement private userManagement;
    ProductManagement private productManagement;

    mapping(address => uint256) public payments;


    event PaymentProcessed(address indexed user, uint256 amount);
    event PurchaseCompleted(address indexed user, uint256 amount);

    constructor(address _tokenAddress, address userManagementAddress, address productManagementAddress) {
        emaxToken = IERC20(_tokenAddress);
        userManagement = UserManagement(userManagementAddress);
        productManagement = ProductManagement(productManagementAddress);
       
    }

    /**
     * @notice Processes a payment for the total amount in the user's cart.
     * @param _user Address of the user making the payment.
     */
    function processPayment(address _user) external  {
        uint256 total = calculateTotal();
        require(emaxToken.balanceOf(_user) >= total, "Insufficient balance");
        require(emaxToken.transferFrom(_user, address(this), total), "Failed to transfer tokens");

        payments[_user] += total;
        userManagement.clearCart(_user); // Clear cart after successful payment
        emit PaymentProcessed(_user, total);
        emit PurchaseCompleted(_user, total);
    }

    /**
     * @notice Calculates the total cost of all items in the user's cart.

     * @return total The total cost of the cart.
     */
    function calculateTotal() public view returns (uint256 total) {
        total = 0;
        UserManagement.CartItem[] memory cart = userManagement.getCartItems();
        for (uint i = 0; i < cart.length; i++) {
            uint256 productPrice = productManagement.productPrice(cart[i].productId);
            total += productPrice * cart[i].quantity;
        }
        return total;
    }

    function mintToken(address _receiver) external {
    require(_receiver != address(0), "Invalid address: zero address");
    emaxToken.mint(_receiver, 10000); // Mint 10,000 tokens to the specified address
}


    /**
     * @notice Adds a user to the payment processor role.
     * @param user Address of the new payment processor.
     */
   
}

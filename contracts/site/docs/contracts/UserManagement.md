﻿## UserManagement


### CartItem

```solidity
struct CartItem {
  uint256 productId;
  uint256 quantity;
}
```
### User

```solidity
struct User {
  address userAddress;
  struct UserManagement.CartItem[] cart;
}
```
### users

```solidity
mapping(address => struct UserManagement.User) users
```

### constructor

```solidity
constructor(address productManagementAddress) public
```







### addProductToCart

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="UserManagement" functionKey="0x8bb2700a" />

Adds a product to the user's cart.



#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| productId | uint256 | The ID of the product to add. |
| quantity | uint256 | The quantity of the product to add. |


### clearCart

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="UserManagement" functionKey="0xbd86d013" />

Clears the cart of a user.





### getCartItems

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="UserManagement" functionKey="0x05e410dd" />

Gets the cart items of the calling user.




#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | struct UserManagement.CartItem[] | An array of cart items. |

### removeCartItem

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="UserManagement" functionKey="0xd4aafffe" />

Removes a specific item from the user's cart based on index.



#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| index | uint256 | The index of the cart item to remove. |



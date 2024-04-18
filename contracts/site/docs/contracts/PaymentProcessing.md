﻿## PaymentProcessing


### emaxToken

```solidity
contract IERC20 emaxToken
```

### payments

```solidity
mapping(address => uint256) payments
```

### constructor

```solidity
constructor(address _tokenAddress, address userManagementAddress, address productManagementAddress) public
```







### processPayment

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="PaymentProcessing" functionKey="0x8fe123d7" />

Processes a payment for the total amount in the user's cart.



#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _user | address | Address of the user making the payment. |


### calculateTotal

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="PaymentProcessing" functionKey="0xe2f3d4b5" />

Calculates the total cost of all items in the user's cart.




#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| total | uint256 | The total cost of the cart. |

### mintToken

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="PaymentProcessing" functionKey="0x01173a74" />








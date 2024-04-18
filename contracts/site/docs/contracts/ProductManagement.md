﻿## ProductManagement


### productList

```solidity
struct ProductManagement.Product[] productList
```

### products

```solidity
mapping(uint256 => struct ProductManagement.Product) products
```

### productIdCounter

```solidity
uint256 productIdCounter
```

### isAdmin

```solidity
mapping(address => bool) isAdmin
```

### owner

```solidity
address owner
```

### ProductStatus

```solidity
enum ProductStatus {
  Available,
  OutOfStock,
  Discontinued
}
```
### Product

```solidity
struct Product {
  uint256 id;
  bytes32 productName;
  bytes32 productDescription;
  bytes32 productImage;
  uint256 productQuantity;
  uint256 productPrice;
  enum ProductManagement.ProductStatus status;
}
```
### constructor

```solidity
constructor() public
```







### onlyOwner

```solidity
modifier onlyOwner()
```

### onlyAdmin

```solidity
modifier onlyAdmin()
```

### addProduct

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ProductManagement" functionKey="0x9b9e03ba" />







### updateProductStatus

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ProductManagement" functionKey="0x920e2621" />







### checkProductAvailability

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ProductManagement" functionKey="0x0f1298d9" />







### getAllProducts

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ProductManagement" functionKey="0x02ee3a52" />







### productPrice

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ProductManagement" functionKey="0xfd68b3ff" />







### addAdmin

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ProductManagement" functionKey="0x70480275" />








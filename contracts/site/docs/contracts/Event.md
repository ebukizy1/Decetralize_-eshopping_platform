﻿## Event


### ProductStatus

```solidity
enum ProductStatus {
  Available,
  OutofStock,
  Backordered,
  Preorder,
  OnSale
}
```
### ProductAdded

```solidity
event ProductAdded(uint256 productId, bytes32 productName)
```

### ProductUpdated

```solidity
event ProductUpdated(uint256 productId, uint8 status)
```

### AdminAdded

```solidity
event AdminAdded(address newAdmin)
```

### ProductAvailabilityChecked

```solidity
event ProductAvailabilityChecked(uint256 productId, bool isAvailable)
```

### ShipmentCreated

```solidity
event ShipmentCreated(address sender, address receiver, uint256 pickupTime, uint256 distance)
```

### ShipmentInTransit

```solidity
event ShipmentInTransit(address sender, address receiver, uint256 pickupTime)
```

### ShipmentDelivered

```solidity
event ShipmentDelivered(address sender, address receiver, uint256 deliveryTime)
```

### PaymentProcessed

```solidity
event PaymentProcessed(address user, uint256 amount)
```

### PurchaseCompleted

```solidity
event PurchaseCompleted(address user, uint256 amount)
```

### CartUpdated

```solidity
event CartUpdated(address user, uint256 productId, uint256 quantity)
```

### CartCleared

```solidity
event CartCleared(address user)
```

### CartItemRemoved

```solidity
event CartItemRemoved(address user, uint256 productId)
```


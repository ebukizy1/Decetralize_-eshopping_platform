﻿## ShipmentManagement


### shipments

```solidity
mapping(address => struct ShipmentManagement.Shipment[]) shipments
```

### isAdmin

```solidity
mapping(address => bool) isAdmin
```

### shipmentCount

```solidity
uint256 shipmentCount
```

### owner

```solidity
address owner
```

### Shipment

```solidity
struct Shipment {
  address sender;
  address receiver;
  uint256 pickupTime;
  uint256 deliveryTime;
  uint256 distance;
  enum ShipmentManagement.ShipmentStatus status;
  bool isPaid;
}
```
### ShipmentStatus

```solidity
enum ShipmentStatus {
  PENDING,
  IN_TRANSIT,
  DELIVERED
}
```
### constructor

```solidity
constructor() public
```







### onlyAdmin

```solidity
modifier onlyAdmin()
```

### onlyOwner

```solidity
modifier onlyOwner()
```

### createShipment

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ShipmentManagement" functionKey="0x47cf953a" />







### startShipment

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ShipmentManagement" functionKey="0xeb62c89c" />







### completeShipment

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ShipmentManagement" functionKey="0xfccdaaa2" />







### addAdmin

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ShipmentManagement" functionKey="0x70480275" />







### getShipment

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ShipmentManagement" functionKey="0x8365da54" />







### getShipmentCount

<BonadocsWidget widgetConfigUri="ipfs://bafkreify7dmp673rtgkhldamihokw5pfelg76tnpjwevj2c52utiaxkfte" contract="ShipmentManagement" functionKey="0xb7dfd93d" />








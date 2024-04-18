# Documentation E-Shopping Application with Delivery Services and Payment System


### `EmaxToken`	: 0x0B9081eBde12f794114F5F7bCFc82eD77a985a90
### `ProductManagement` :	0xEc3206d2ED62e64F7182c3f450097dDBC32D0678
### `ShipmentManagement` :	0x5e0469180F6306d50dc85D2255069638bF89f839
### `UserManagement` :	0xd34C5B6eC88EA90047ee59dF98E14BfA79c0c5f7
### `PaymentProcessing`	0x1b07968276234049b7D8E891a31C2571746EE8d4

## Table of contents
- <a href="#dsds"> 1. OverView</a>
    - <a href="dd">1.1 Token Economy</a>
    - <a href="pp">1.2 Seamless Shopping Experience</a>
    - <a href="dd">1.3 Innovative Payment Processing</a>
    - <a href="jj">1.4 Efficient Delivery Services</a>
    - <a href="kk">1.5 Empowering Decentralization</a>
- <a href="#links"> 2.0 System Architecture</a>
- <a href="#Ppc"> 3.0 Smart Contract Specifications</a>
    - <a href="#overview"> 3.1 UserManagement.sol</a>
    - <a href="#review"> 3.2 ProductManagement.sol</a>
    - <a href="#fsx"> 3.3 ShipmentManagement.sol</a>
    - <a href="#fst">  3.4PaymentProcessing.sol</a>
- <a href="#fs"> 4.0 Frontend Interaction</a>
    - <a href="#fs"> 4.1 Connecting to Web3 Providers</a>
    - <a href="#fs"> 4.2 Interacting with Smart Contracts</a>
    - <a href="#fs"> 4.3  Example Setup</a>
- <a href="#fse"> 5.0 Conclusion</a>


### <h3 id="dsds"> 1 OverView <h3>
  Our project is an innovative e-commerce platform built on blockchain technology, offering users the freedom to shop for a diverse range of products while embracing decentralization and incentivizing participation through a unique token economy.

- #### 1.1 Token Economy:
The heart of our platform lies in EmaxToken, a native cryptocurrency designed to facilitate seamless transactions within our ecosystem. To kickstart user engagement and adoption, we distribute 10,000 EmaxTokens to each new user upon registration. This approach not only provides users with a hassle-free entry into the world of decentralized commerce but also encourages them to explore the benefits of blockchain technology.

- #### 1.2 eamless Shopping Experience:
With our platform, users enjoy the convenience of browsing and purchasing products of their choice, similar to leading e-commerce giants like Jumia. However, what sets us apart is the ability for users to transact using EmaxTokens, offering a novel payment method that promotes financial inclusivity and decentralization.

- #### 1.3 Innovative Payment Processing:
Our PaymentProcessing contract seamlessly integrates with our user and product management systems, enabling secure and efficient payment processing for each transaction. Users can effortlessly complete purchases using their EmaxTokens, with the system automatically calculating the total cost based on their cart contents.

- #### 1.4 Efficient Delivery Services:
In addition to facilitating transactions, our platform goes above and beyond by offering delivery services for users' convenience. Leveraging off-chain technology such as Google Maps, our smart contracts meticulously track shipment details including pickup times, delivery statuses, and distances traveled. This ensures a smooth and transparent delivery process while maintaining user privacy and security.

-  #### 1.5 Empowering Decentralization:
At its core, our project aims to empower users with the knowledge and experience of decentralized technologies. By incentivizing participation through EmaxToken rewards and offering seamless integration with Web3 login processes, we strive to educate and onboard users into the world of decentralized commerce, fostering a community-driven ecosystem that prioritizes transparency and empowerment.


### <h3 id="links">2.0 System Architecture <h3>
#### Overview
The E-Shopping Application leverages blockchain technology to create a decentralized platform that integrates smart contracts for user management, product listings, payments, and logistics. This architecture not only enhances security and transparency but also ensures that the system is scalable and efficient, suitable for handling a high volume of transactions and user interactions typical of e-commerce platforms.

##### Technologies
- `Solidity`: The programming language used to write the smart contracts.
- `Hardhat`: These development environments is used for compiling, deploying, testing, and managing smart contracts.


## <h3 id="Ppc"> Smart Contract Specifications <h3>
### 3.1 UserManagement.sol

#### Overview
The UserManagement.sol contract is central to handling all user-related activities within the platform. It manages user registration, session authentication, shopping cart operations, and integrates with the payment processing systems to ensure seamless transaction capabilities for users.

##### Key Functionalities
`Authentication` :
Utilizes Ethereum wallet addresses for user authentication, ensuring that users can only access and manipulate their cart and perform transactions from their own accounts.
##### Cart Management
- `AddProductToCart`: Enables users to add products to their shopping cart. This function checks product availability through the ProductManagement.sol before adding.
- `RemoveProductFromCart`: Allows users to remove items from their shopping cart, either one item at a time or clearing all items.
- `GetCartItems`: Returns a list of items currently in the user's shopping cart, useful for displaying cart contents on the frontend.
- `Integration with Payment Systems` :
Interfaces with PaymentProcessing.sol to facilitate checkout processes. When users decide to checkout, UserManagement.sol sends a request to PaymentProcessing.sol with the total payable amount calculated based on the cart contents.
##### Events
- `ProductAddedToCart`: Triggered each time a new product is added to the cart.
- `ProductRemovedFromCart`: Emitted when a product is removed from the cart.
Security Features
Implements checks to ensure that only the owner of an account can add or remove items from their cart or initiate payments.

##### Integration Points
- `ProductManagement.sol`: Queries for product details and availability.
- `PaymentProcessing.sol`: Interacts directly during the checkout phase to handle

### 3.2 ProductManagement.sol
#### Overview
ProductManagement.sol serves as the backbone for managing the inventory and product listings on the platform. It handles product additions, updates, deletions, and provides critical functionalities to ensure that products are managed efficiently and securely.

##### Key Functionalities
- `AddProduct`: Allows admins to add new products to the platform, including details like name, description, price, and stock quantity.
- `UpdateProduct` : Admins can update existing product details, such as modifying prices, descriptions, or adjusting stock levels.
- `RemoveProduct`: Enables the removal of products from the listing, typically used when a product is discontinued or out of stock permanently.
- `GetAllProducts` : Retrieves a list of all products currently available on the platform, which can be used to display products to users.
- `GetProduct`: Fetches details of a specific product by its ID, useful for detailed product views and editing interfaces.
-`AddAdmin`: Allows the super admin to assign admin roles to other users, enabling them to manage product listings.
##### Events
- `ProductAdded`: Emitted when a new product is successfully added to the platform.
- `ProductUpdated`: Triggered when product details are updated.
- `ProductRemoved`: Fired when a product is removed from the listings.
##### Integration Points
Interacts closely with UserManagement.sol to check for product availability when users add items to their cart.


## 3.3 ShipmentManagement.sol
### Overview
ShipmentManagement.sol is crucial for managing the logistics aspect of the platform. It tracks and updates the status of shipments from the point of order to delivery, ensuring transparency and efficiency in the delivery process.

##### Key Functionalities
- `CreateShipment` : Initiates a new shipment record when an order is placed, capturing details like sender, receiver, and expected pickup and delivery times.
- `UpdateShipmentStatus` : Allows updating the status of a shipment (e.g., from pending to in transit, and then to delivered).
Shipment Tracking
- `GetShipmentDetails`: Provides detailed information about a specific shipment, including its current status and tracking information.
- `GetAllShipments`: Retrieves all shipments, useful for administrative overview and customer service operations.
##### Events
- `ShipmentCreated`: Emitted when a new shipment is created.
- `ShipmentStatusUpdated`: Triggered when the status of any shipment is updated.

##### Integration Points
Interacts with PaymentProcessing.sol for integrating payments with delivery status, ensuring that shipments are only dispatched after successful payment confirmations.

## 3.4 PaymentProcessing.sol
### Overview
PaymentProcessing.sol handles all financial transactions within the platform, managing payments and integrating with the token-based economy.

##### Key Functionalities
- `ProcessPayment` : Executes payment transactions where users pay for their 
- `Mint EmaxTokens`. It mint 10000 token to new users in the platform.
- `RefundPayment`: Handles refund processes if necessary, ensuring tokens are returned correctly under certain conditions.
##### Payment Integration
- `CalculateTotal`: Computes the total amount payable based on the items in a user's cart, interfacing directly with UserManagement.sol to fetch cart details.
##### Events
- `PaymentProcessed`: Emitted after a successful payment transaction.
- `PaymentRefunded`: Triggered when a refund is issued.
##### Integration Points
Relies on UserManagement.sol to retrieve user cart contents for total cost calculation and to clear carts post-purchase.
Coordinates with ShipmentManagement.sol to align payment status with shipment dispatches.

## Frontend Interaction
This section describes how the frontend interfaces with the smart contracts, including details on Web3 integration and user interaction patterns. The application utilizes Web3Modal, a library that provides a universal way to connect to various Ethereum wallets, enhancing user experience and accessibility.

#### 4.1 Connecting to Web3 Providers
Web3Modal offers a seamless integration point for Ethereum wallets like MetaMask, WalletConnect, Coinbase Wallet, and others. It simplifies the process of connecting a web application to a blockchain network.

#### Implementation Steps:

- `Install Web3Modal`: First, add Web3Modal to your project.
`npm install web3modal`

- ` import Web3Modal from 'web3modal'`;
- `import Web3 from 'web3'`;

|const providerOptions = {
     /* configuration for different wallet providers */
};

const web3Modal = new Web3Modal({
  network: "mainnet", // optional
  cacheProvider: true, // optional
  providerOptions // required
});

async function connectWallet() {
  const provider = await web3Modal.connect();
  const web3 = new Web3(provider);

  // Subscribe to accounts change
  provider.on("accountsChanged", (accounts) => {
    console.log(accounts);
  });

  // Subscribe to chainId change
  provider.on("chainChanged", (chainId) => {
    console.log(chainId);
  });

  // Subscribe to provider connection
  provider.on("connect", (info) => {
    console.log(info);
  });

  // Subscribe to provider disconnection
  provider.on("disconnect", (error) => {
    console.log(error);
  });
}
#### 4.2 Interacting with Smart Contracts
To interact with smart contracts, you need the contract ABI and address. Here’s how to set up interactions using Web3.js.
#### Preparation:
- `Contract ABI`: The ABI (Application Binary Interface) is crucial as it enables the JS code to understand the contract's methods and structures.
- `Contract Address`: The deployed contract address on the blockchain.
##### Example Setup:
- `const contractABI = [/* ABI array here */]`;
- `const contractAddress = '0xYourContractAddressHere'`;

const contract = new web3.eth.Contract(contractABI, contractAddress);
Interacting with a Contract:


async function getProductDetails(productId) {
  const response = await contract.methods.getProductDetails(productId).call();
  return response;
}

async function purchaseProduct(productId, quantity) {
  const accounts = await web3.eth.getAccounts();
  await contract.methods.purchaseProduct(productId, quantity).send({ from: accounts[0] });
}
4.3 Handling Events and Updates
Smart contracts emit events, and you should handle these in your frontend to update the UI accordingly.

Example: Listening to Events

javascript
Copy code
contract.events.ProductPurchased()
.on('data', (event) => {
  console.log(event);
  // Update UI after product purchase
})
.on('error', console.error);
Using React Hooks:
For a modern web app, you might use React hooks to manage state and effects.

import { useEffect } from 'react';

function useContractEvent(contract, eventName, handler) {
  useEffect(() => {
    const eventSubscription = contract.events[eventName]()
      .on('data', handler)
      .on('error', console.error);

    return () => {
      eventSubscription.unsubscribe();
    };
  }, [contract, eventName, handler]);
}


### <h3 id="fse">Conclusion </h3>

In conclusion, the E-Shopping Application with Delivery Services and Payment System offers a comprehensive solution for users to engage in decentralized commerce seamlessly. By leveraging blockchain technology and integrating smart contracts, the platform provides a familiar shopping experience while introducing innovative features such as EmaxToken for payments and efficient delivery services.

The project's token economy, seamless shopping experience, innovative payment processing, efficient delivery services, and focus on empowering decentralization collectively contribute to its appeal and usability. Through incentivizing user participation and education about decentralized technologies, the platform aims to build a vibrant community-driven ecosystem.


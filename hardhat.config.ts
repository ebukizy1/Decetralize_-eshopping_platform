import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config();
require('@bonadocs/docgen')



const { ABITRUM_RPC_URL, ACCOUNT_PRIVATE_KEY ,ABITRUM_SCAN_KEY} = process.env;
module.exports = { 
  solidity: "0.8.24",
  networks: {
 arbitrum: {
      url: `https://arbitrum-mainnet.infura.io/v3/${ABITRUM_RPC_URL}`,
      accounts: [ACCOUNT_PRIVATE_KEY],
      chainId: 42161,
    },
    // etherscan: {
    //   apiKey: ABITRUM_SCAN_KEY,
      
    },
docgen: {
  projectName: "Decentralize Eshopping Application",
  projectDescription:"E-Shopping Application with Delivery Services and Payment System.",
  outputDir: "./site",
  deploymentAddresses: {
    EmaxToken : [
      {
        chainId: 42161, // sepolia testnet
        address: "0x0B9081eBde12f794114F5F7bCFc82eD77a985a90",
      },
    ],
    ProductManagement: [
      {
        chainId: 42161, // sepolia testnet
        address: "0xEc3206d2ED62e64F7182c3f450097dDBC32D0678",
      },
    ],
    ShipmentManagement: [
      {
        chainId: 42161, // sepolia testnet
        address: "0x5e0469180F6306d50dc85D2255069638bF89f839",
      },
    ],
    UserManagement: [
      {
        chainId: 42161, // sepolia testnet
        address: "0xd34C5B6eC88EA90047ee59dF98E14BfA79c0c5f7",
      },
    ],
    PaymentProcessing: [
      {
        chainId: 42161, // sepolia testnet
        address: "0x1b07968276234049b7D8E891a31C2571746EE8d4",
      },
    ],
  },
  },
};



// export default config;


// EshoppingApplication#EmaxToken - 0x28f15bf7974e60B0F7132b867846571627bB5e5d
// EshoppingApplication#ProductManagement - 0x9e069EE173E13A2cd04838A63d94968f4BFdb9fF
// EshoppingApplication#ShipmentManagement - 0x836e464D858063B4c0B62965250b724707a41AC4
// EshoppingApplication#UserManagement - 0x7ee39849Bb07297fe6F62C39378a8Eb0B3e2A0bD
// EshoppingApplication#PaymentProcessing - 0x245C1DDE9F0F0Be608eA92E1C36a466574C29B06

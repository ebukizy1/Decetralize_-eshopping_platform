import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";



const EshoppingApplication = buildModule("EshoppingApplication", (m) => {



  const emaxToken = m.contract("EmaxToken");

  const productManagement = m.contract("ProductManagement");

  const usermanagment = m.contract("UserManagement", [productManagement]);

  const paymentProcessing = m.contract("PaymentProcessing",[emaxToken, usermanagment, productManagement]);

  const shipmentManagement = m.contract("ShipmentManagement");

  return { emaxToken,productManagement, usermanagment, paymentProcessing,shipmentManagement};
});

export default EshoppingApplication;

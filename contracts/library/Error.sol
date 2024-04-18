// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

library  Error {

 /**
     * @dev The caller account is not authorized to perform an operation.
     */
   error  OwnableUnauthorizedAccount(address account);
   error OwnableInvalidOwner(address owner);
   error INSUFFICIENT_FUNDS();
   error NOT_AUTHORIZE();
   error INVALID_AMOUNT();

   

    
}
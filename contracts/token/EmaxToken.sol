// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract EmaxToken is ERC20 {
    constructor()
        ERC20("Emax", "EMX")
    {
        mint(msg.sender, 1000000000);
    }


    function mint(address to, uint256 amount) public  {
        _mint(to, amount);
    }
}
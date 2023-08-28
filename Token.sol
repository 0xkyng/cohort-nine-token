// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {ERC20}  from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 100e18);
    }
}
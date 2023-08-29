///SPDX-License-Identifier: MIT
import {ERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
pragma solidity ^0.8.0; 
contract StandardToken is ERC20{
    constructor() ERC20("na", "sy"){
        _mint(address(this),1_000e8);
    }
}
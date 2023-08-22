// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;


contract CohortNine {

    string _name;
    string _symbol;
    uint constant DECIMAL = 18;
    uint _totalsupply;
    address public owner;

    mapping (address => uint) _balance;

    mapping(address => mapping(address => uint)) _allowance;

    modifier onlyOwner() {
        require(msg.sender == owner, "must be the owner");
        _;
    }

    constructor(string memory name_, string memory symb_) {
        _name = name_;
        _symbol = symb_;
        owner = msg.sender;
    }

    function name() public view returns(string memory) {
        return _name;
    }

    function symbol() public view returns(string memory) {
        return _symbol;
    }

    function decimals() public pure returns(uint) {
        return DECIMAL;
    }

    function totalSupply() public view returns(uint) {
        return _totalsupply;
    }

    


}
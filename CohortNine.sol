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

    event Transfer(address from, address to, uint value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    event Minted(address to, uint value);


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

    function balanceOf(address _owner) public view returns (uint256 balance){
    return _balance[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
    require(_to != address(0), "transfer to address ZERO not allowed");
    require(_value > 0, "increase value");
    require(balanceOf(msg.sender) >= _value, "insufficient funds");
    _balance[msg.sender] -= _value;
    _balance[_to] += _value;
    success = true;
    emit Transfer(msg.sender, _to, _value);

}
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
    require(_to != address(0), "transfer to address ZERO not allowed");
    require(_value > 0, "increase value");
    require(balanceOf(_from) >= _value, "insufficient funds");
    require(_value <= allowance(_from, _to) , "insufficient allowance");
    _allowance[_from][_to] -= _value;
    _balance[_from] -= _value;
    _balance[_to] += _value;
    success = true;
    emit Transfer(_from, _to, _value);
}

function approve(address _spender, uint256 _value) public returns (bool success){
    _allowance[msg.sender][_spender] = _value;
    success = true;
    emit Approval(msg.sender, _spender, _value);

}

function allowance(address _owner, address _spender) public view returns (uint256 remaining){
    return _allowance[_owner][_spender];
}
  function mint(address _to, uint value) external payable  {
    require(_to != address(0), "transfer to address ZERO not allowed");
    require(msg.value == 5 ether * value, "less than the required amount");

    _totalSupply += value;
    _balance[_to] += value; 

    emit Minted(_to, value);
  }

  function burn( address _to,uint value) external{
    require(balanceOf(msg.sender) >= value, "insufficient funds");
    _balance[msg.sender] -= value; 
    _totalSupply -= value * 90/100;

    uint remainingValue = value * 10/100;
    _balance[_to] += remainingValue;
    
  }

  function withdrawAll() external onlyOwner {
    payable(owner).transfer(address(this).balance);
}



    


}
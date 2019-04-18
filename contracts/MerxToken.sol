pragma solidity ^0.5.0;

contract MerxToken {
	string  public name = "MerxToken";
    string  public symbol = "MERX";
    string  public standard = "MerxToken v1.0";
	// sets totalSupply of tokens
	uint256 public totalSupply;

	 event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );


    //  sets key/value pair for token balance
	mapping(address => uint256) public balanceOf;
	mapping(address => mapping(address => uint256)) public allowance;

    // sets initial balance _initialSupply

	constructor (uint256 _initialSupply) public {
    balanceOf[msg.sender] = _initialSupply;
    totalSupply = _initialSupply;
}
    // allows to transfer funds, makes sure msg.sender has funds
     function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }
   // chooses who is approving the account to spend tokens, sets the allowance
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
}

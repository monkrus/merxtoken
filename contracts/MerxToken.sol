pragma solidity ^0.5.0;

//import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
//import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
//import 'openzeppelin-solidity/contracts/math/SafeMath.sol';
import  'openzeppelin-solidity/token/ERC20/ERC20Burnable.sol';


contract MerxToken is ERC20Burnable {
    string  public name = "MerxNet";
    string  public symbol = "MERX";
    string  public standard = "v1.0";
    uint8   public decimals = 18; // same value as wei
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Burn(address indexed burner, uint256 value);
    function burn(uint256 _value) public {
    _burn(msg.sender, _value);
    }
    function _burn(address _who, uint256 _value) internal {
    require(_value <= balances[_who]);
    balances[_who] = balances[_who].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);
    emit Burn(_who, _value);
    emit Transfer(_who, address(0), _value);
  
}
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

    function merxtoken (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
        // TODO: Handle fractional tokens
        // TODO: Trigger a transfer event when deploying
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

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



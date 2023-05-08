// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "./IERC20.sol";

contract ERC20 is IERC20{
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupplay = 10000 ether; //or 10000 * 10**18;

    
    mapping(address => mapping(address => uint256)) private _allowances;
    mapping(address => uint256) private _balances;

    function balanceOf(address _owner) public view returns (uint256) {
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_balances[msg.sender] >= _value, "Insufficient balance");

        _balances[msg.sender] -= _value;
        _balances[_to] += _value;

        // TODO: emit event

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        _allowances[msg.sender][_spender] += _value;
        
        return true;
    }


} 
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "./IERC20.sol";

contract ERC20 is IERC20{
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupplay = 10000 ether; //or 10000 * 10**18;


    mapping(address => uint256) private _balances;

    function balanceOf(address _owner) public view returns (uint256) {
        return _balances[_owner];
    }

} 
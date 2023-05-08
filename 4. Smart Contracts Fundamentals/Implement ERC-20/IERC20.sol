// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;


interface IERC20 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupplay() external view returns (uint256);
    function balanceOf(address _owner) external view returns (uint256 balance);

} 


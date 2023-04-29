// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract FundRaiser {
    // uint > positive number
    // int > negative number
    uint256 public shares;

    // the function will only be available externally > external
    function addShares(address receiver, uint256 amount) external  {
        shares += amount;
    }

}
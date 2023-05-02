// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    uint256 public startTime;
    uint256 public endTime;

    constructor(uint256 start, uint256 end) {
        require(start < end, "Invalid period");
        startTime = start;
        endTime = end;
    }
}

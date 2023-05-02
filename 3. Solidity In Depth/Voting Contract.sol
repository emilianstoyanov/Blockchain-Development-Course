// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    uint256 public startTime;
    uint256 public endTime;

    event NewVote(address indexed stakeholder, uint256 shares);

    constructor(uint256 start, uint256 end) {
        require(start < end, "Invalid period");
        startTime = start;
        endTime = end;
    }

    // constructor
    function vote(address stakeholder) external {
        // vote logic here
        emit NewVote(stakeholder, shares);
    }
}

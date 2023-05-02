// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract Test {

    uint[5] public arr = [1, 2, 3, 4, 5];

    function addNumber() external view returns (uint256) {
        uint256 res;
        for(uint i = 0; i < arr.length; i++) {
            res += arr[i];
        }
        return res;
    }
}
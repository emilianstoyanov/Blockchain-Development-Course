// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// we send ethers to the contract!!!
contract Test {

    // first send money from other account to  the contract
    function payTest() external payable {
    }

    // then send the received money from admin to third account
    function test() external {
        uint256 amount = 5000000000000000000;
        payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4).transfer(amount);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

}

// we send ethers to the admin
// contract Test {
//     address admin = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

//     // first send money from other account to admin
//     function payTest() external payable {
//         payable(admin).transfer(msg.value);
//     }

//     // then send the received money from admin to third account
//     function test() external {
//         uint256 amount = 5000000000000000000;
//         payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4).transfer(amount);
//     }

//     function getBalance() external view returns (uint256) {
//         return address(this).balance;
//     }

// }

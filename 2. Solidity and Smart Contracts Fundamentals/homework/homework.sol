// SPDX-License-Identifier: MIT
// If we want it to be open source so that it can be used by other people, we put the MIT license

// Best practice is to put an accurate version
pragma solidity 0.8.19;


contract homeRepairService {    
    address payable owner = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    address payable client = payable(msg.sender);

    mapping(uint256 => address) requestOwner;
    mapping(uint256 => uint256) toPay;


    // a request from the customer to fix something
    function addRepairRequest(uint256 ID, string memory description) public {
        requestOwner[ID] = msg.sender;
    }

    // when the company determines that it can accept the repair request
    function approveRequest(uint256 ID, uint256 amount) public {

        // only the contract owner can accept
        if (msg.sender != owner) {
            revert();
        }
   
        if (requestOwner[ID] == address(0)) {
            revert("Not valid request");
        }

        // ethereumAmount = ethereum * 10**18;
        toPay[ID] = amount;
    }
}
// SPDX-License-Identifier: MIT
// If we want it to be open source so that it can be used by other people, we put the MIT license

// Best practice is to put an accurate version
pragma solidity 0.8.19;


contract homeRepairService {    
    address payable owner = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    address payable client = payable(msg.sender);
    uint256 public IDStorage;

    mapping(uint256 => address) requestOwner;
    mapping(uint256 => uint256) toPay;
    mapping(uint256 => bool) isPaid;


    string public userName;

    mapping(address => uint256) public shares;
    mapping(uint256 => bool) public verufy;
    mapping(address => bool) public isAuditor;
    mapping(uint256 => mapping(address => bool)) public isConfirmed;


    uint256 ethereumAmount;
    uint256 public valueEth;
    uint256 countOfAuditors = 0;



    // a request from the customer to fix something
    function addRepairRequest(uint256 ID) public {
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
    
    // payment for the service
    function pay(uint256 ID) public payable {
        // only approved request can be payed
        require(toPay[ID] !=0, "Not approved");
        require(msg.value == toPay[ID]);

        isPaid[ID] = true;
    }

    // here the auditors check that everything has been done correctly
    function confirm(uint256 ID) public  {

        require(isAuditor[msg.sender], "Not auditor");

        require(isPaid[ID] == true, "Not paid");
        verufy[ID] = true;

        countOfAuditors++;
        if(countOfAuditors > 2) {
            executeRepaiRequest();
        }

    }

    function executeRepaiRequest() public payable {
        require(countOfAuditors >= 2, "You cannot transfer coins!");
        owner.transfer(ethereumAmount);
    }

    // only then a certain threshold has passed
    function moneyBack() public payable {
        client.transfer(ethereumAmount);
    }

}
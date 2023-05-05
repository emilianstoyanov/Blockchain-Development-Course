
# Solidity In Depth


# Table of Contents

1. Constructor
2. Events
3. Custom Modifiers
4. Inheritance
5. Calling External Contracts
6. Libraries


# Problem: Voting

* Bob needs a voting system for his stakeholders
* Traditional voting
    * Lack of transparency and trust
    * Higher fees
    * Physical attendance


# Overview: Fund Raising

* Bob is owner
* Bob can create more shares
* Everybody can buy from Bob’s shares
* Shares of users can be fetched


# Constructors

* Constructors
    * A constructor is an optional function declared with 
    the constructor keyword
    * It is executed upon contract creation
    * Allow configurable initial state of the contracts


# Voting

    // SPDX-License-Identifier: GPL-3.0
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

# Events

* Events
    * Notify external applications
    * Events can be subscribed to by external applications
    * Solidity events are stored in the transaction logs of 
    the Ethereum blockchain
    * The indexed attribute adds events parameters to a 
    special data structure known as "topics"


# Voting

    event NewVote(address indexed stakeholder, uint256 shares);

    // constructor

    function vote(address stakeholder) external {
        // vote logic here
        emit NewVote(stakeholder, shares);
    }

# Reference Types
* Value Types - stores its data directly in the 
memory it owns
* Reference Types – stores a reference to a value in 
memory
* Values of reference type can be modified through 
multiple different names
* Mappings
* Structs
* Arrays

# Arrays

* Array is a collection of values of the same(!) type
* They can be both fixed-size and dynamic-size
* Array elements can be of any type, including 
mapping or struct

    `uint[][2] memory numbers;`

* fixed-size arrays

        uint[5] public arr = [1, 2, 3, 4, 5];
        function addNumber() external view returns (uint256) {
            uint256 res;
                for(uint i = 0; i < arr.length; i++) {
                res += arr[i];
            }
            return res;
        }

* dynamic-size arrays

        uint[] public arr = [1, 2, 3, 4, 5];
        function addNumber(uint256 value) external returns (uint256) {
            arr.push(value);
            return arr.length;
        }

    `remove last element with .pop()`

* Data Locations

* Every reference type has an additional annotation, the "data 
location"
* There are three data locations
    * memory >  `uint[] memory numbers;`
        * Temporary data location (store data during function execution)
        * Destroyed when the function execution ends
    * storage > `uint[] storage numbers;`
        * Persistent data location (store data on the blockchain)
    * calldata > `function myFunction(uint[] calldata myArray) external { }`
        * Read-only data location that is used to store the function arguments



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

# Data Location

## Value Types
* Storage


        contract SimpleStorage {
            uint storedData; 
            // ...
        }

* Memory

        contract SimpleStorage {
            uint storedData;

            function memoryExample() {
            uint memoryData;
            }
        }


### *Specifier is not added!* 



* storage


        uint[] public arr = [1, 2, 3, 4, 5];
        function checkRes() external returns (uint256 x) {
            uint[] storage arrRef = arr;
            arrRef[0] = 2;
            return arr[0];
        }


    `output: x = 2`


* memory

        uint[] public arr = [1, 2, 3, 4, 5];
        function checkRes() external view returns (uint256 x,
        uint256 y) {
            uint[] memory arrRef = arr;
            arrRef[0] = 2;
            return (arrRef[0], arr[0]);
        }

    `output: x = 2, y = 1 `


* calldata – cheaper read-only option

        function checkArr(uint256[] calldata arr) external view returns (uint256) {
            return arr[0];
        }

# Arrays

        uint[] public arr = [1, 2, 3, 4, 5];
        function addNumber(uint256 value) external returns (uint256) {
            arr.push(value);
            return arr.length;
        }

# Allocating Memory Arrays

* As opposed to storage arrays, it is not possible to 
resize memory arrays


        uint[] public arr = [1, 2, 3, 4, 5];
        function checkRes() external view {
            uint[] memory arrRef = arr;
            arrRef[0] = 2;
            arrRef.push(1);
        }

# Structs

* Solidity provides a way to define new types in the 
form of structs
* Struct types can be used inside mappings and arrays 
and they can themselves contain mappings and 
arrays
* It is not possible for a struct to 
contain a member of 
its own type

        struct Vote {
            address shareholder;
            uint shares;
            uint timestamp;
        }


# Voting

* keep votes in storage

        function vote(address shareholder) external {
            votes.push(Vote({
                shareholder: shareholder,
                shares: 1000, // TODO: fetch real shares
                timestamp: block.timestamp
            }));

            emit NewVote(shareholder, 1);
        }


# Mappings (Here we go again…)

* Can NOT be allocated to memory

        function checkMap() external view {
            mapping(address => uint256) storage balanceRef = 
            balance;
        }

# State vs Local variables

        contract Test {
            // state variables
            uint256 storageVar;
            uint256[] storageArr;

            function test() external view {
                // local variables
                uint256 memoryVar = storageVar;
                uint256[] storage arrReference = storageArr;
                uint256[] memory arrCopy = storageArr;
            }
        }
# Strings

* Dynamic-size array of UTF-8 encoded characters

        function test() external pure returns (string memory, bytes32) {
            string memory hello = "Hello world!";
            bytes32 helloTwo = "Hello world!";
            return (hello, helloTwo);
        }

`Use bytes32 when having string up to 32 bytes!`

# Inheritance

* Create a new contract that inherits properties and 
methods from an existing contract
* When a contract inherits from other contracts, only a 
single contract is created on the blockchain
* State variables shadowing is considered as an error.
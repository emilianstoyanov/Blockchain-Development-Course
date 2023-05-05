
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


# Voting

        contract Math {
            function sum(uint256 a, uint256 b) internal pure returns
            (uint256) {
                return a + b;
            }
        }
        contract Voting is Math {
            function vote(address shareholder, bool position) external {
                positive = sum(positive, 1000); 
        }

# Overriding

* Base functions can be overridden if they are 
marked as virtual
* The overriding function must then use 
the override keyword
* Visibility can be changed from external to public
only

        // Math contract
        function sum(uint256 a, uint256 b) internal pure virtual
            returns (uint256) {
                return a + b;
        }

        // Vote contract
        function sum(uint256 a, uint256 b) internal pure override
            returns (uint256) {
                return a + b + b;
        }


# Abstract Contracts

* Define a set of functions that must be implemented
* Contracts must be marked as abstract when at least 
one of their functions is not implemented or when 
they do not provide arguments for all of their base 
contract constructors

        abstract contract Feline {
            function foo() public pure virtual returns (bytes32);
        }


# Interfaces

* Interfaces are similar to abstract contracts, but they 
cannot have any functions implemented as well as 
any state variables

        interface Token {
            struct Coin { string obverse; string reverse; } 
            function transfer(address recipient, uint amount) external; 
        }


# Custom Modifiers

## Custom Modifiers
* Allow you to define custom conditions or checks that 
must be met before or after executing a function


        contract Owned {
            address payable owner;
            constructor() { owner = payable(msg.sender); }
            modifier onlyOwner {
                require( msg.sender == owner, "Only owner can call this function." );
                _;
            }
            function register() public payable onlyOwner {
                // code here
            }
        }

# External Function Calls

## External Function Calls

* Functions of other contracts have to be called externally
* All function arguments are copied to memory

# Voting

        import "./FundRaiser.sol"; // Import the other contract source code

        FundRaiser fundRaiser; // Declare the contract variable

        constructor(address _fundRaiser) {
            // more code here...
            // initialize
            fundRaiser = FundRaiser(_fundRaiser);
            }

        function vote(bool position) external {
            // Call other contract
            // In case call revert, whole transaction will revert
            (uint256 shares) = fundRaiser.getShares(msg.sender);
            require(shares > 0, "Not a shareholder");
        }

# Voting System Overview

* Constructor
* Reference Types
* Data locations
* Inheritance
* Custom Modifiers
* External Function Calls

# External Function Calls

* You can call payable functions as well
* You can specify the amount of Wei or gas sent with 
{value: 10, gas: 10000}
* You need to use the 
modifier payable

# External Function Calls

    contract InfoFeed {
        function info() public payable returns (uint ret) {
            return 42;
        }
    }
    contract Consumer {
        InfoFeed feed;
        function setFeed(InfoFeed addr) public {
            feed = addr;
        }

        function callFeed() public {
            feed.info{value: 10, gas: 800}();
        }
    }



# Libraries

## Libraries

* Way to share functionality between Solidity 
contracts without creating a separate contract 
instance
* Not deployed as standalone contracts
* Cannot access the state variables of the contract 
that uses them, so any state information must be 
passed to the library functions as parameters


        struct Data { mapping(uint => bool) flags; }
        library Set {
            function insert(Data storage self, uint value) public returns (bool) {
                if (self.flags[value]) return false;
                self. flags[value] = true; return true;
            }
        }

        contract C {
            Data knownValues;
            function register(uint value) public {
                require(Set.insert(knownValues, value));
            }
        }

# Using For

* The directive using A for B; can be used to attach 
functions (A) as member functions to any type (B)
* These functions will receive the object they are called 
on as their first parameter

`using { insert } for Data;`

`using Set for Data;`

    contract C {
        using Set for Data;

        Data knownValues;
        
        function register(uint[] memory values) public {
            for (uint i = 0; i < values.length; i++) {
            require(knownValues.insert(values[i]), 
            "Value already exists");
        }
    }
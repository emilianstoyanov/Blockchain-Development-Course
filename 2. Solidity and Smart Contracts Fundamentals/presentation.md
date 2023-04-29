
# Solidity and Smart Contracts Fundamentals 

* ## dApps, Smart Contracts, Remix IDE, Solidity


# Table of Contents

1. Web3.0 and Decentralized Applications
2. Smart Contracts
3. Remix IDE
4. Solidity Fundamentals


# Internet Phases

* Web1.0 > Read-only

* Web2.0 > Read, Write

*  Web3.0 > Read, Write, Own


# What is dApp?

* Has its backend code running on a decentralized 
peer-to-peer network
* Decentralized
* Deterministic


# Benefits of dApp

* Zero downtime
* Privacy
* Resistance to censorship
* Complete Data Integrity
* Trustless computation/verifiable behaviour

# Drawbacks of dApp

* Maintenance
* Performance overhead
* Network congestion
* User experience
* Centralization

# Ethereum Stack

* End-User Application
* Ethereum Client API
* Ethereum Node
* Smart Contract
* EVM

# Smart Contracts
 * ###   What is Smart Contract?
    * A program that runs on the Ethereum blockchain
    * Collection of code (functions) and data (state) that 
    lives at a specific address
    * Type of Ethereum account, but not controlled by a 
    user
    * It is permissionless and composable


# Vending Machine
   * ### With a specific input, a certain output is guaranteed


    // Allow anyone to purchase cupcakes
    function purchase(uint amount) public payable {
    require(
        msg.value >= amount * 1 ether,
        "You must pay at least 1 ETH per cupcake"
    );
    require(
        cupcakeBalances[address(this)] >= amount,
        "Not enough cupcakes in stock to complete this purchase"
    );
        cupcakeBalances[address(this)] -= amount;
        cupcakeBalances[msg.sender] += amount;
    } 

    
# Solidity

# What is Solidity?
* Main language for creating Smart Contracts on 
Ethereum
* Object-oriented, compiled, statically typed language
* Supports inheritance, libraries and complex data 
types – arrays, structs, mapings
* Includes many built-in functions – msg object, 
keccak, etc.
* Open source and has a large and active community 
of developers

# Remix IDE

 * Integrated Development Environment for Solidity 
smart contracts
* Web-based, but there is also a desktop version
* Provides a user-friendly interface for writing, 
debugging, deploying and verifying smart contracts
* Includes various plugins, which provide additional 
features
* Suitable mostly for small contracts and testing
some stuff

## [Solidity Documentation](https://docs.soliditylang.org/en/v0.8.19/)
## [Solidity Remix IDE](https://remix.ethereum.org/)


# Problem: Fund Raising 

` Problem solved with code in 'contact.sol' file!`

* Bob has a brilliant business idea
* He needs the best way to raise funds
* Traditional crowdfunding
    * Lack of transparency and trust
    * Higher fees

# Basic Contract Structure 
 ....

# Fund Raising

    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.4;
    contract FundRaiser {
    }
    
# Variable

* Variables can be declared using `<type> <name>;`
* Uninitialized variables have a default value 
depending on their data type
    * `bool:` `false`
    * `int:` `uint:` `0`
    * `address:` `0x0000000000000000000000000000000`
    * `string:` `An empty string (`""`)`
    * `bytes:` `bytes32:` `An empty byte array (`[]`)`

# Identifiers
* Used to identify a variable, function, event, 
modifier, or other program element
* Case-sensitive and can consist of letters, digits, and 
underscores, but may NOT start with a digit
* It is common convention to prefix private variables 
with underscore

        contract MyContract {
            uint private _data; 
            // ...
        }
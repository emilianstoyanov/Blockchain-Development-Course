
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

    
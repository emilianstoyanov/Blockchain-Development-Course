# Exercise: NFT Tickets Marketplace


The NFT Tickets Marketplace is a platform that provides two main functionalities - event creation and ticket 
purchasing. The platform is designed to provide users with a secure and efficient way to create and purchase event 
tickets in a decentralized manner. Entertainment creators can use the platform to sell tickets for the events they 
create. People can use the platform to buy tickets for their favorite events. Tickets can be used as digital passes not 
only for the event but for additional perks like discord groups, private meetings with the artists and more



## Functionality

The platform should provide the following functionalities:

## 1. Event contract


This contract should represent every unique event in the marketplace. It should have important event data such 
as ticketsSaleStart, ticketsSaleEnd, name, ticketsPrice, etc. Optionally, creators should be able to store images, 
descriptions, and any other additional data for the event.


Every user can use the contract to buy a ticket for the event at a specified price.
The creator of the event should be able to withdraw their profit, and after the end of the buy period, one of the 
users who already bought a ticket for the specified event should be randomly chosen to win one extra ticket.


## 2. Marketplace contract

This contract should represent an administrative panel for the marketplace. Creators should be able to deploy 
new events, and all event instances must be kept here

* Additional Tasks

    1. Deployment to Testnet

        This allows developers to test the contract's functionality and ensure that it works as intended before 
        deploying it to the main network.

    2. Code Verification

        The process of matching a Smart Contract's source code to its on-chain bytecode.

    3. NatSpec Documentation

        NatSpec, or Natural Language Specification, is a standardized way of documenting smart contract functions 
        using natural language. This allows developers to easily understand the purpose and functionality of each 
        function, without needing to read the code directly.


## Bonus task

`Implement the marketplace as a single erc-1155 contract.`
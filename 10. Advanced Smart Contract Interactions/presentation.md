# Advanced Smart Contract Interactions

1. Alchemy
2. Web3-Onboard
3. Contract Interaction
4. Wallet Connect


# Alchemy

*  A blockchain infrastructure provider that offers a 
suite of developer tools and services to build and 
scale decentralized applications

* TODO
    * Register
    * Create Sepolia App
    * Get API KEY


# Web3-Onboard

* The best way to connect a wallet
* Blocknative product
* Free to use
* 35 unique wallets

# Web3-Onboard with React

* Install
 
 ```js
npm install @web3-onboard/react @web3-onboard/injected-wallets
 ```


* Initialize

 
 ```js
import { init, useConnectWallet } from "@web3-onboard/react";
import injectedModule from "@web3-onboard/injected-wallets";
import { ethers } from "ethers";
 ```


 ```js
const API_KEY = "<ALCHEMY_KEY>";
const rpcUrl = `https://eth-sepolia.g.alchemy.com/v2/${API_KEY}`;
 ```
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

 ```js
// initialize Onboard
init({
    wallets: [injected],
    chains: [
        {
            id: "0x1",
            token: "ETH",
            label: "Ethereum Mainnet",
            rpcUrl,
        },
    ],
});
```

* Connect


 ```js
const [{ wallet, connecting }, connect, disconnect] = useConnectWallet()
```

 ```js
<button
disabled={connecting}
onClick={() => (wallet ? disconnect(wallet) : connect())}
>
{connecting ? "connecting" : wallet ? "disconnect" : "connect"}
</button>
```


* Auto connect previous wallet

 ```js
// init option
connect: {
    autoConnectLastWallet: true,
},
```


* Ensure proper chain is connected

 ```js
const [
{
chains, // the list of chains that web3-onboard was initialized 
with
connectedChain, // the current chain the user's wallet is 
connected to
settingChain, // boolean indicating if the chain is in the 
process of being set
},
setChain, // function to call to initiate user to switch chains 
in their wallet
] = useSetChain();
```

* Check wallets state
    * TODO
        * Show wallet address in the NavBar

            ```js
            const connectedWallets = useWallets();
            ```

* Remove account center


    ```js
    accountCenter: {
        desktop: {
            enabled: false
        },
        mobile: {
            enabled: false
        }
    },
    ```

# Task: ERC-20 Transfer Interface

* Create a minimal interface for transfering ERC-20 tokens
* Functionalities
    * Connect with wallet
    * Form with to and amount fields
    * List with transfers made
    * Proper Validations and Error Handling

# Setup Dev Environment

* Deploy ERC-20 to Sepolia 
* Import ABI in Frontend

# Contract Interaction

## Ethers.js Contract instance

* Create new contract instance

    ```js
   const injectedProvider = connectedWallets[0].provider;

    const provider = new

    ethers.providers.Web3Provider(injectedProvider);

    const signer = provider.getSigner();

    const contract = new ethers.Contract(ERC20_ADDRESS, ERC20_ABI, signer);
    ```


## Ethers.js Contract instance

* Create a tx invoking contract method


    ```js
    contract
            .transfer(sendTo, ethers.utils.parseEther(amount))
            .then((tx) => {
                console.log("Transaction:", tx);
                return tx.wait();
            })
    ```

* Query contract data


    ```js
    useEffect(() => {
        const contract = getContract();
        contract
            .balanceOf(connectedWallets[0].accounts[0].address)
            .then((newBalance) => {
            setBalance(ethers.utils.formatEther(newBalance));
            });
    }, [connectedWallets, getContract]);
    ```

*  Listening to events


     ```js
    const filter = contract.filters.Transfer(null, myAddress);
    // Receive an event when that filter occurs
    contract.on(filter, (from, _to, amount, event) => {
        // The to will always be "myAddress"
        // Show EventModal
    });
    ```

* Fetch historical events



     ```js
    const filter = contract.filters.Transfer(myAddress, null);
    // List all transfers sent from me in a specific block range
    contract.queryFilter(filter, 0, "latest")
        .then((fetchedTransfers) => {
            fetchedTransfers = fetchedTransfers.
                map((transfer) => {
                transfer.value =
                    transfer.args.value.toString();
                    transfer.from = transfer.args.from;
            return transfer;
        });
    });
    ```

* Estimate gas

    ```js
    const filter = contract.filters.Transfer(myAddress, null);
    // List all transfers sent from me in a specific block range
    contract.queryFilter(filter, 0, "latest")
        .then((fetchedTransfers) => {
            fetchedTransfers = fetchedTransfers.
                map((transfer) => {
                    transfer.value =
                        transfer.args.value.toString();
                        transfer.from = transfer.args.from;
            return transfer;
        });
    });
    ```

# Wallet Connect

## Wallet Connect

* Open Source Protocol
* Connects decentralized applications with mobile 
wallets
* QR code or deep linking

```js
GENERATE_SOURCEMAP=false
```

```js
import walletConnectModule from "@web3-onboard/walletconnect";

// init
const walletConnect = walletConnectModule();

// add to config options
wallets: [injected, walletConnect],
```




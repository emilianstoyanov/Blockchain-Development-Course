# Smart Contract Interactions



1. React
2. Ethers.js
3. Fetching Data from contracts
4. Wallet Interaction



# React

## What is React

 - A JavaScript library for building user interfaces
 - Declarative
 - Component-based
 - The Web3.0 choice

 # Installation

  - Node.js required
  - create-react-app (!)

    ```
    npx create-react-app web3
    npm start
    ```

# Components

- A piece of the UI that has its own logic and appearance
- A JavaScript functions that return markup

    ```js
    function MyButton() {
        return <button>I'm a button</button>;
    }
    ```

# Nesting Components

- React Components start with a capital letter

    ```js

    export default function MyApp() {
        return (
            <div>
                <h1>Welcome to my app</h1>
                <MyButton/>
            </div>
        );
    }
    ```

# JSX

- Syntax extension for JavaScript
- Write HTML-like markup inside a JavaScript fil
- Logic determines content
- Rendering logic and markup live together

# JSX Rules

- Return a single root element


```jsx
<>
<h1>Hedy Lamarr's Todos</h1>
<img
src='https://i.imgur.com/yXOvdOSs.jpg'
alt='Hedy Lamarr'
class='photo'
/>
<ul>
…
</ul>
</>
```


# JSX Rules

-  Close all the tags


```jsx
<>
<h1>Hedy Lamarr's Todos</h1>
<img
src='https://i.imgur.com/yXOvdOSs.jpg'
alt='Hedy Lamarr'
class='photo'
// img is not closed
<ul>
</ul>
</>
```

# JSX Rules

- camelCase all most of the things



```jsx
<img
src='https://i.imgur.com/yXOvdOSs.jpg'
alt='Hedy Lamarr'
className='photo'
/>
```

# Adding styles

- Write CSS in a separate file

    ```js
    <img className='avatar' />
    ```

- Import in your component

    ```js
    import "./MyApp.css";

    /* In your CSS */
    .avatar {
        border-radius: 50%;
    }
    ```

# Displaying data

- Curly braces
- "Escape back" into JavaScript

    ```js
    export default function MyApp() {
        const user = "Mitko";
        return (
            <>
                <h1>My name is </h1>
                <h1>{user.name}</h1>
            </>
        );
    }
    ```


# Responding to Events

- Declare event handler

    ```js
    function MyButton() {
        function handleClick() {
            alert("You clicked me!");
        }

        // Don't call the handler, just pass it
        return <button onClick={handleClick}>Click
        me</button>;
    }
    ```

# Updating the screen

- You want your component to "remember" 
information and display it
- Add state to your component

    ```js
    import { useState } from "react";
    ```

    ```js
        // declare state variable
    const [count, setCount] = useState(0);
    ```

    ```js
    function handleClick() {
        // update the state variable value
        setCount(count + 1);
    }
    return (
        <button onClick={handleClick}>
            Clicked {count} times
        </button>;
    )
    ```

# Use Hooks

- Functions starting with use are called Hooks
- useState is a built-in Hook provided by React
- Other built-in hooks
- You can write your own hooks by combining the 
existing ones

# Sharing data between components

- React allows components to communicate with each 
other
- TODO:
    - Add a second button to the MyApp component
    - Update the counters of both buttons, no matter which one is clicked


```js
export default function MyApp() {
    return (
        <>
            <MyButton />
            <MyButton />
        </>
    );
}
``` 

```js
function MyButton({ count, onClick }) {
    return <button onClick={onClick}>Clicked 
    {count} times</button>;
}
``` 



```js
export default function MyApp() {
        const [count, setCount] = useState(0);

        function handleClick() {
            setCount(count + 1);
        }

    return (
        <>
            <MyButton count={count} onClick={handleClick} />
            <MyButton count={count} onClick={handleClick} />
        </>
    );
    }
```


# Ethers.js

## Ethereum Stack
- End-User Application
- Ethereum Client API
- Ethereum Node
- Smart Contract
- EVM


# Setup Dev Environment

- Start Hardhat Network
- Deploy Contract
- Extract addresses and ABI information

# Web3.0 Frontend Application

- Web application that interacts with decentralized 
application.

- ~~Server~~ Smart contracts

- Combines traditional web development technologies 
with Web3-related libraries, wallet integrations, and 
blockchain interactions


# Ethers.js

- Implements 3 main classes
- Provider
    - Provides an abstraction for a connection to the Ethereum 
    Network
    - Read-only access to the Blockchain and its status.
- Signer
    - Usually in some way directly or indirectly has access to a 
    private key
    - Can sign messages and transactions to authorize the 
    network to charge your account ether to perform 
    operations

- Contract
    - Represents a connection to a specific contract on the 
    Ethereum Network, so that applications can use it like a 
    normal JavaScript object.


# Install Ethers.js

- Suitable for demo purposes only
- Serve from own server in production

   ```js
    npm i ethers

    import { ethers } from "ethers";
   ```

# Wallet Connection

- Wallet is the application that manage your keys 
(account)
- To execute transactions your Web3.0 app needs 
signatures from your keys

# Connecting to Ethereum: MetaMask

- TODO: Add localhost network to Metamask


# Connecting to Ethereum: MetaMask

```js
if (!window.ethereum) {
    alert("install MetaMask");
    return;
}
// A Web3Provider wraps a standard Web3 provider, which is
// what MetaMask injects as window.ethereum into each page
const provider = 
new ethers.providers.Web3Provider(window.ethereum);
```


```js
provider
    .send("eth_requestAccounts", [])
    .then((accounts) => {
if (accounts.length > 0) setCurrentAccount(accounts[0]);
})
.catch((e) => console.log(e));
```


# Fetching Data from contracts

- Once you have a Provider, you have a read-only 
connection to the blockchain

```js
// Look up the current block number
await provider.getBlockNumber()
// 16987688
// Get the balance of an accountby address
balance = await provider.getBalance(”<address>")
// { BigNumber: "182334002436162568" }
```

# Fetching data


```js
// Often you need to format the output to something more user-friendly,
// such as in ether (instead of wei)
ethers.utils.formatEther(balance)
// '0.182334002436162568'
// If a user enters a string in an input field, you may need
// to convert it from ether (as a string) to wei (as a BigNumber)
ethers.utils.parseEther("1.0")
// { BigNumber: "1000000000000000000" }
```

# Wallet Interaction

## Writing to the Blockchain

- Create transactions and send them to the blockchain

```js
// Send 1 ether to an address.
const tx = signer.sendTransaction({to: "<address>", value: ethers.utils.parseEther("1.0")});
```
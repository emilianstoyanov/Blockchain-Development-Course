import logo from './logo.svg';
import './App.css';

import MyButton from './components/MyButton/MyButton';
import { useEffect, useState } from "react";

import { ethers } from "ethers";

function App() {

  const [count, setCount] = useState(0);
  const [currentAccount, setCurrentAccount] = useState(null);


  useEffect(() => {
    if (localStorage.getItem("connected")) {
      handleConnection();
    }
  }, []);

  function handleClick() {
    setCount((count) => count + 1);
  }

  function handleConnection() {
    if (!window.ethereum) {
      alert("install MetaMask");
      return;
    }
  

    // A Web3Provider wraps a standard Web3 provider, which is
    // what MetaMask injects as window.ethereum into each page
    const provider = new ethers.providers.Web3Provider(window.ethereum);

    provider
      .send("eth_requestAccounts", [])
      .then((accounts) => {
        if (accounts.length > 0) setCurrentAccount(accounts[0]);
        localStorage.setItem('connected', true);
      })
      .catch((e) => console.log(e));

  }
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  function getBlockNumber() {
    // Look up the current block number
    provider.getBlockNumber();
    // 16987688
 
  }
  return (
    <>
      <div className="App">
        <MyButton buttonClicked={handleClick} count={count} />
        <MyButton buttonClicked={handleClick} count={count} />
        <button onClick={handleConnection}> Connect </button>
      </div>
      <div></div>
      {
        currentAccount ? <h1>{currentAccount}</h1> : <h1>Not connected</h1> 
      }
    </>
  );
}

export default App;

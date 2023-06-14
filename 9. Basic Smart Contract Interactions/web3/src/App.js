import logo from './logo.svg';
import './App.css';

import MyButton from './components/MyButton/MyButton';
import { useState } from "react";

import { ethers } from "ethers";

function App() {

  const [count, setCount] = useState(0);

  function handleClick() {
    setCount((count) => count + 1);
  }

  function handleConnection() {
    if (!window.ethereum) {
      alert("install MetaMask");
      return;
    }
  }

// A Web3Provider wraps a standard Web3 provider, which is
// what MetaMask injects as window.ethereum into each page
const provider = new ethers.providers.Web3Provider(window.ethereum);


  return (
    <>
      <div className="App">
        <MyButton buttonClicked={handleClick} count={count} />
        <MyButton buttonClicked={handleClick} count={count} />
        <button buttonClicked={handleClick}> Connect </button>
      </div>
    </>
  );
}

export default App;

import "./App.css";

import { init, useConnectWallet } from "@web3-onboard/react";
import injectedModule from "@web3-onboard/injected-wallets";
// import { ethers } from "ethers";

const API_KEY = "d_7FIHXdQXSHbXSG6kwK8CnuuUaab5vO";
const rpcUrl = `https://eth-sepolia.g.alchemy.com/v2/${API_KEY}`;

const injected = injectedModule();

// initialize Onboard
init({
  // init option
  connect: {
    autoConnectLastWallet: true,
  },
  wallets: [injected],
  chains: [
    {
      id: "0xaa36a7",
      token: "ETH",
      label: "Ethereum Sepolia",
      rpcUrl,
    },
  ],
});

function App() {
  const [{ wallet, connecting }, connect, disconnect] = useConnectWallet()

  return (
    <div className="App">
      <button
        disabled={connecting}
        onClick={() => (wallet ? disconnect(wallet) : connect())}
        >
        {connecting ? "connecting" : wallet ? "disconnect" : "connect"}
    </button>
    </div>
  )
}

export default App;

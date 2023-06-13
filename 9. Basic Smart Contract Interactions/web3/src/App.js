import logo from './logo.svg';
import './App.css';

import MyButton from './components/MyButton/MyButton';
import { useState } from "react";
function App() {

  const [count, setCount] = useState(0);

  function handleClick() {
    setCount((count) => count + 1);
  }

  return (
    <>
      <div className="App">
        <MyButton buttonClicked={handleClick} count={count} />
        <MyButton buttonClicked={handleClick} count={count} />
      </div>
    </>
  );
}

export default App;

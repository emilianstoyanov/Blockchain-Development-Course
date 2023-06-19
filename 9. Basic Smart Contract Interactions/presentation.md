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
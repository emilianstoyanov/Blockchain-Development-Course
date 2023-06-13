import "./MyButton.css";



export default function MyButton({ count, buttonClicked }) {
    return <button onClick={buttonClicked}> Clicked {count} times </button>
}


import "./MyButton.css";

import { useState } from "react";

export default function MyButton({ count, buttonClicked }) {
    return <button onClick={buttonClicked}> Clicked {count} times </button>
}


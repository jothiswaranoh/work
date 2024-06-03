import React, { useState } from 'react';
import './components/feedback.scss';
import './App.css';
import Container from '@mui/material/Container/Container';
import Feedback from './components/feedback';
import Signup from './components/signup';
import Login from './components/login';

function App() {
  const [currentPage, setCurrentPage] = useState("feedback");

  const handleChangeToSignUp = () => {
    setCurrentPage("signup");
  };

  const handleChangeToLogin = () => {
    setCurrentPage("login");
  };

  const handleChangeToFeedback = () => {
    setCurrentPage("feedback");
  };
  return (
    <>
          <nav>
        <button onClick={handleChangeToSignUp}>Sign Up</button>
        <button onClick={handleChangeToLogin}>Login</button>
        <button onClick={handleChangeToFeedback}>Feedback</button>
      </nav>
      <div>
        {currentPage === "signup" && <Signup />}
        {currentPage === "login" && <Login />}
        {currentPage === "feedback" && <Feedback />}
      </div>
    </>

  );
}

export default App;

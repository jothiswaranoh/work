import "./feedback.scss";
import React, { ChangeEvent, useState } from "react";
import {
  Box,
  Button,
  Container,
  Modal,
  TextField,
  Typography,
} from "@mui/material";

function Feedback() {
  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });


  const handleChange = (event: ChangeEvent<HTMLInputElement>) => {
    const { id, value } = event.target;
    setFormData({ ...formData, [id]: value });
  };

  const handleSubmit = () => {
    console.log(formData);
  };

  return (
    <div className="login-container">
      <h1>Login</h1>
      <TextField
        id="email"
        label="Email"
        variant="outlined"
        onChange={handleChange}
      />
      <TextField
        id="password"
        label="Password"
        type="password"
        variant="outlined"
        onChange={handleChange}
      />
      <Button variant="contained" onClick={handleSubmit}>
        Login
      </Button>
    </div>
  );
}

export default Feedback;

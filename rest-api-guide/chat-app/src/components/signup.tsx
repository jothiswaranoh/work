import React, { ChangeEvent, useState } from "react";
import { Button, TextField } from "@mui/material";

function Signup() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    password: "",
    confirmPassword: "",
    phoneNumber: "",
    address: "",
  });
  const [passwordError, setPasswordError] = useState("");

  const handleChange = (event: ChangeEvent<HTMLInputElement>) => {
    const { id, value } = event.target;
    setFormData({ ...formData, [id]: value });
  };

  const handleSubmit = () => {
    // Check if passwords match
    if (formData.password !== formData.confirmPassword) {
      setPasswordError("Passwords do not match");
    } else {
      console.log(formData);
      setPasswordError("");
    }
  };

  return (
    <div className="signup-container">
      <h1>Signup</h1>
      <div className="signup-form">
        <TextField
          id="name"
          label="Name"
          variant="outlined"
          onChange={handleChange}
        />
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
        <TextField
          id="confirmPassword"
          label="Confirm Password"
          type="password"
          variant="outlined"
          onChange={handleChange}
          error={passwordError !== ""}
          helperText={passwordError}
        />
        <TextField
          id="phoneNumber"
          label="Phone Number"
          variant="outlined"
          onChange={handleChange}
        />
        <TextField
          id="address"
          label="Address"
          variant="outlined"
          onChange={handleChange}
        />
        <Button variant="contained" onClick={handleSubmit}>
          Signup
        </Button>
      </div>
    </div>
  );
}

export default Signup;

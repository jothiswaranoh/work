
import React, { ChangeEvent, useState } from "react";
import { Button, TextField, ThemeProvider, Typography, createTheme } from "@mui/material";
import { makeStyles } from "@mui/styles";
const theme = createTheme({
  spacing: 8, // Set the spacing value according to your design system
  // Add other theme properties as needed
  components: {
    MuiPaper: {
      styleOverrides: {
        root: {
          padding: '8px', // Adjust padding according to your design
          border: '1px solid #e0e0e0', // Adjust border color and style
          borderRadius: '4px', // Adjust border radius
          boxShadow: '0px 2px 4px rgba(0, 0, 0, 0.1)', // Adjust box shadow
        },
      },
    },
  },
});
const useStyles = makeStyles((theme) => ({
  formContainer: {
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
  },
  textField: {
    marginBottom:20,
  },
}));


function Feedback() {
  const classes = useStyles();

  const [formData, setFormData] = useState({
    name: "",
    email: "",
    password: "",
    confirmPassword: "",
    phoneNumber: "",
    address: "",
  });

  const handleChange = (event: ChangeEvent<HTMLInputElement>) => {
    const { id, value } = event.target;
    setFormData({ ...formData, [id]: value });
  };

  const handleSubmit = () => {
    console.log(formData);
    // Here you can implement form validation and submission logic
  };

  return (
    <ThemeProvider theme={theme}>
      
    <div className={classes.formContainer}>
      <Typography variant="h4" gutterBottom>
        Feedback Form
      </Typography>
      <form>
        <TextField
          id="name"
          label="Name"
          variant="outlined"
          className={classes.textField}
          onChange={handleChange}
          fullWidth
          />
        <TextField
          id="email"
          label="Email"
          variant="outlined"
          className={classes.textField}
          onChange={handleChange}
          fullWidth
          />
        <TextField
          id="password"
          label="Password"
          type="password"
          variant="outlined"
          className={classes.textField}
          onChange={handleChange}
          fullWidth
          />
        <TextField
          id="confirmPassword"
          label="Confirm Password"
          type="password"
          variant="outlined"
          className={classes.textField}
          onChange={handleChange}
          fullWidth
          />
        <TextField
          id="phoneNumber"
          label="Phone Number"
          variant="outlined"
          className={classes.textField}
          onChange={handleChange}
          fullWidth
          />
        <TextField
          id="address"
          label="Address"
          variant="outlined"
          className={classes.textField}
          onChange={handleChange}
          fullWidth
          />
        <Button variant="contained" onClick={handleSubmit} fullWidth>
          Submit
        </Button>
      </form>
    </div>
          </ThemeProvider>
  );
}

export default Feedback;

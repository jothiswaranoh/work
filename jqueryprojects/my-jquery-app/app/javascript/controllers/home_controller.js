// app/assets/javascripts/controllers/my_controller.js

// Import the necessary modules
// import jQuery from "jquery";

// Define your controller actions
const myController = {
  someAction: function() {
    // Code that calls the blockUI method to block the UI
    jQuery(document).ready(function() {
      jQuery('#myElement').block();
    });

    // Code that calls the unblock method to unblock the UI after some time
    setTimeout(function() {
      jQuery('#myElement').unblock();
    }, 3000); // Unblock after 3 seconds
  },
};

export default myController;

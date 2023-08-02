// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


// import "main"

// window.jQuery.blockUI();

 console.log("js")


 // Import jQuery as a module
import jQuery from "jquery";

async function myCustomFunction() {
    // Your function code here
    window.jQuery = jQuery;
    window.$ = jQuery;
    console.log("Custom function executed.");
    
  }

  myCustomFunction().then(() => {
    // Import file1.js after the custom function is executed
    
      // Function that needs to be executed after file1.js is imported
      function myFunction1() {
        // Your function code here
        console.log("Function 1 executed.");
      }
  
      // Call the function
      myFunction1();
      
    });
  


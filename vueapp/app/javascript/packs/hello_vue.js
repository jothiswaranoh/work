import { createApp } from "vue";
import App from "../app.vue";

// Wait for the DOM to be fully loaded before initializing Vue
document.addEventListener("DOMContentLoaded", () => {
  // Create a new Vue app
  const app = createApp(App);

  // Mount the Vue app to the body of the document
  app.mount(document.body);

  // Log the Vue app for debugging purposes
  console.log(app);
});

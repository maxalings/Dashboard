import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // This function is triggered on successful AJAX form submission
  redirectToList(event) {
    const [data, status, xhr] = event.detail;

    // Redirect to the routine list URL
    const routineListUrl = ""; // Replace with your actual routine list path
    window.location.href = routineListUrl;
  }
}

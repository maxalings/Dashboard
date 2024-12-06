import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="habits"
export default class extends Controller {
  connect() {
  }

  done(event) {
    const taskId = event.currentTarget.dataset.id;
    fetch(`/tasks/${taskId}/done`, {
      method: "post",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
      }
    });
  }

}

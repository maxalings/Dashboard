import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox", "profile", "widgets"]; // Définit les targets pour les checkboxes

  connect() {
  }

  uncheck(event) {
    const clickedCheckbox = event.target;

    this.checkboxTargets.forEach((checkbox) => {
      if (checkbox !== clickedCheckbox) {
        checkbox.checked = false; // Décoche toutes les autres checkboxes
      }
    });
  }

  floating(event) {
    this.profileTarget.classList.add("animate-float-1");
    this.widgetsTarget.classList.add("animate-float-2");
  }

  stopfloating(event) {
    this.profileTarget.classList.remove("animate-float-1");
    this.widgetsTarget.classList.remove("animate-float-2");
  }
}

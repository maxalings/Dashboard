import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox"]; // Définit les targets pour les checkboxes

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
}

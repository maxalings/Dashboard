import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["icon", "widget"]; // Définit les targets pour les checkboxes

  connect() {
  }

  addanimation(event) {
    // Sélectionne l'élément cible à partir de l'événement et applique l'animation
    const icon = event.currentTarget.querySelector('[data-dashboard-target="icon"]');
    icon.classList.add("animate-heartbeat"); // Applique l'animation de battement de cœur
  }

  removeanimation(event) {
    // Sélectionne l'élément cible et enlève l'animation
    const icon = event.currentTarget.querySelector('[data-dashboard-target="icon"]');
    icon.classList.remove("animate-heartbeat"); // Retire l'animation
  }
}

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["midget"]; // Définit les cibles accessibles

  connect() {
    this.startClock();
  }

  startClock() {
    const initialTime = this.parseTime(this.midgetTarget.dataset.time);

    const updateClock = () => {
      const now = new Date();
      const elapsed = now - this.startTime; // Temps écoulé depuis le chargement
      const currentTime = new Date(initialTime.getTime() + elapsed);

      // Formater l'heure en deux parties
      const options = { hour: "2-digit", minute: "2-digit", hour12: true };
      const [time, period] = currentTime.toLocaleTimeString("en-US", options).split(" ");

      // Mettre à jour l'affichage
      this.midgetTarget.innerHTML = `
      <p class="font-['Orbitron'] text-mint-dark text-xs">${period}</p>
      <p class="font-['Orbitron'] text-mint-dark text-2xl">${time}</p>
      `;
    };

    this.startTime = new Date(); // Enregistrer l'heure initiale
    updateClock(); // Mettre à jour immédiatement
    this.interval = setInterval(updateClock, 1000); // Mise à jour toutes les secondes
  }

  disconnect() {
    clearInterval(this.interval); // Nettoyer l'intervalle
  }

  parseTime(timeString) {
    const [hours, minutes, seconds] = timeString.split(":").map(Number);
    const now = new Date();
    return new Date(now.getFullYear(), now.getMonth(), now.getDate(), hours, minutes, seconds);
  }
}

import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="progress"
export default class extends Controller {
  static targets = ["slider", "output"];

  connect() {
    this.updateValue(); // Update the displayed value on load
  }

  updateValue() {
    // Update the output display when the slider value changes
    this.outputTarget.textContent = this.sliderTarget.value;
  }

  setGoal(event) {
    event.preventDefault(); // Prevent form submission

    // Get the new goal value from the input
    const newGoal = event.target.elements["widget[goal]"].value;
    const slider = this.sliderTarget;

    if (newGoal && !isNaN(newGoal)) {
      // Update the range slider's max value
      slider.max = newGoal;

      // Update the displayed goal
      const goalDisplay = slider.nextElementSibling.nextElementSibling;
      goalDisplay.textContent = `/${newGoal}km`;
    }
  }
}

document.addEventListener('DOMContentLoaded', function() {
  const slider = document.querySelector('input[type="range"]');
  const progressValue = document.getElementById('progressValue');

  if (slider && progressValue) {
    slider.addEventListener('input', function() {
      progressValue.textContent = slider.value;
    });
  }
});

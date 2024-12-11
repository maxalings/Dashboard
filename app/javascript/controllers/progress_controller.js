import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="progress"
export default class extends Controller {
  static targets = ["slider", "output"];

  connect() {
    // Set initial output value
    this.updateValue();
    console.log("connected!")
  }

  updateValue() {
    this.outputTarget.textContent = this.sliderTarget.value;
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

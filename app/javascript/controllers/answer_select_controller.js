import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-select"
export default class extends Controller {
  static targets = ['button'];

  connect() {
    console.log('Hello from Stimulus');
  }

  select(event) {
    console.log(event.currentTarget.value)
    console.log(this.buttonTargets[event.currentTarget.value - 1]);
    this.buttonTargets.forEach((btn) => {
      btn.classList.remove('active-btn')
    })
    this.buttonTargets[event.currentTarget.value - 1].classList.toggle('active-btn');
  }
}

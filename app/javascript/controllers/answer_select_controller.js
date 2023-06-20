import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="answer-select"
export default class extends Controller {
  static targets = ["button"];

  connect() {}

  select(event) {
    this.buttonTargets.forEach((btn) => {
      btn.classList.remove("active-btn");
    });

    event.currentTarget.classList.add("active-btn");
  }
}

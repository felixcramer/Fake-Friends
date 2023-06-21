import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="expand-card"
export default class extends Controller {
  static targets = ["expandableContent", "buttonDown", "buttonUp"];

  connect() {}

  expandCard() {
    this.buttonDownTarget.classList.toggle("hidden");
    this.buttonUpTarget.classList.toggle("hidden");
    this.expandableContentTarget.classList.toggle("hidden");
    this.expandableContentTarget.classList.add(
      "animate__animated",
      "animate__fadeInDown"
    );
  }
}

import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="transition"
export default class extends Controller {
  static targets = ["elementLeft", "elementRight"];

  connect() {}

  pressLinkLeft(e) {
    e.preventDefault();
    let target = e.currentTarget.href;

    this.elementLeftTarget.classList.add("is-active");
    setTimeout(() => {
      window.location.href = target;
    }, 300);
  }

  pressLinkRight(e) {
    e.preventDefault();
    let target = e.currentTarget.href;

    this.elementRightTarget.classList.add("is-active");
    setTimeout(() => {
      window.location.href = target;
    }, 300);
  }
}

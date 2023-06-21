import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="transition"
export default class extends Controller {
  static targets = ["elementLeft", "elementRight", "userMenu", "home"];

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

  pressUserMenu(e) {
    e.preventDefault();
    this.userMenuTarget.classList.toggle("is-active");
    this.homeTarget.classList.toggle("hide-home");
  }

  pressLinkUserMenu(e) {
    e.preventDefault();
    let target = e.currentTarget.href;
    const transition4 = this.element.querySelector(".transition-4");

    transition4.classList.add("is-active");
    setTimeout(() => {
      window.location.href = target;
    }, 300);
  }
}

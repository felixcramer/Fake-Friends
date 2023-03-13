import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="transition"
export default class extends Controller {
  static targets = ["element"];

  connect() {}

  pressLink(e) {
    e.preventDefault();
    console.log("hello world");
    let target = e.currentTarget.href;

    this.elementTarget.classList.add("is-active");
    setTimeout(() => {
      window.location.href = target;
    }, 300);
  }
}

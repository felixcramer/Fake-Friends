import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="add-username"
export default class extends Controller {
  static targets = ["photo"];
  static values = {
    usernames: Array,
  };

  connect() {
    let counter = 0;
    this.photoTargets.forEach((element) => {
      let html = `<p>${this.usernamesValue[counter]}</p>`;
      element.insertAdjacentHTML("beforebegin", html);
      counter++;
    });
  }
}

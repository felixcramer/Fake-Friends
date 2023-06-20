import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="change-number"
export default class extends Controller {
  static targets = ["number"];

  connect() {
    const number = this.numberTarget;
    const changingNumber = function () {
      if (number.innerHTML === "0") {
        clearInterval(timer);
      } else {
        number.innerHTML -= 1;
      }
    };
    const timer = setInterval(() => {
      changingNumber();
    }, 1000);
  }
}

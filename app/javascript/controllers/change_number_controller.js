import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="change-number"
export default class extends Controller {
  static targets = ["number"];

  connect() {
    setInterval(() => {
      this.changingNumber();
    }, 1000);

  }
  changingNumber() {
    if (this.numberTarget.innerHTML === 0) {
      clearInterval(timer);
    } else {
      this.numberTarget.innerHTML -= 1;

    }
  }
}

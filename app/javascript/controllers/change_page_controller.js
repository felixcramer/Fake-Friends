import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="change-page"
export default class extends Controller {
  static targets = ["button", "elementLeft", "divHidden", "divToHide"];
  static values = {
    // Array containing all urls of the room associated
    // with the room_questions
    questionsArray: Array,
    // Final urls to break the loop, first goes to new_round
    // and second to ranking
    finalUrlFirst: String,
    finalUrlSecond: String,
  };
  connect() {
    let currentPage = this.questionsArrayValue.indexOf(
      window.location.pathname,
      0
    );
    // Using the JS dataset attribute to know in which round
    // we currently are
    if (this.buttonTarget.dataset.round === "1") {
      if (currentPage + 1 === this.questionsArrayValue.length) {
        setTimeout(() => {
          this.elementLeftTarget.classList.add("is-active");
          setTimeout(() => {
            this.buttonTarget.click();
            window.location = this.finalUrlFirstValue;
          }, 300);
        }, 5000);
      } else {
        setTimeout(() => {
          this.elementLeftTarget.classList.add("is-active");
          setTimeout(() => {
            this.buttonTarget.click();
            window.location = this.questionsArrayValue[currentPage + 1];
          }, 300);
        }, 5000);
      }
    }

    if (this.buttonTarget.dataset.round === "2") {
      if (currentPage + 1 === this.questionsArrayValue.length) {
        setTimeout(() => {
          this.buttonTarget.click();
          this.divHiddenTarget.classList.toggle("hidden");
          this.divToHideTarget.classList.toggle("hidden");
          setTimeout(() => {
            this.elementLeftTarget.classList.add("is-active");
            setTimeout(() => {
              window.location = this.finalUrlSecondValue;
            }, 300);
          }, 3000);
        }, 5000);
      } else {
        setTimeout(() => {
          this.buttonTarget.click();
          this.divHiddenTarget.classList.toggle("hidden");
          this.divToHideTarget.classList.toggle("hidden");
          setTimeout(() => {
            this.elementLeftTarget.classList.add("is-active");
            setTimeout(() => {
              window.location = this.questionsArrayValue[currentPage + 1];
            }, 300);
          }, 3000);
        }, 5000);
      }
    }
  }
}

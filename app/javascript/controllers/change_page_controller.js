import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="change-page"
export default class extends Controller {
  static targets = ["button", "elementLeft"];
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
    if (currentPage + 1 === this.questionsArrayValue.length) {
      setTimeout(() => {
        this.elementLeftTarget.classList.add("is-active");
        setTimeout(() => {
          this.buttonTarget.click();
          // Using the JS dataset attribute to know in which round
          // we currently are
          window.location =
            this.buttonTarget.dataset.round === "1"
              ? this.finalUrlFirstValue
              : this.finalUrlSecondValue;
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
}

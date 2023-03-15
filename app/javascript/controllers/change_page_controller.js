import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="change-page"
export default class extends Controller {
  static targets = ["button"];
  static values = {
    questionCount: Array,
    url: String,
  };

  connect() {
    const length = this.questionCountValue.length;
    let currentPage = this.questionCountValue.indexOf(
      window.location.pathname,
      0
    );

    if (currentPage + 1 === length) {
      setTimeout(() => {
        this.buttonTarget.onCLick();
        window.location = this.urlValue;
      }, 5000);
    } else {
      setTimeout(() => {
        this.buttonTarget.onCLick();
        window.location = this.questionCountValue[currentPage + 1];
      }, 5000);
    }
  }
}

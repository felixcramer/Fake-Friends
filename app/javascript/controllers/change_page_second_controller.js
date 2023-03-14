import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="change-page-second"
export default class extends Controller {
  static values = {
    questionCount: Array,
    url: String,
  };

  connect() {
    console.log(this.questionCountValue);
    const length = this.questionCountValue.length;
    let currentPage = this.questionCountValue.indexOf(
      window.location.pathname,
      0
    );
    if (currentPage + 1 === length) {
      setTimeout(() => {
        window.location = this.urlValue;
      }, 10000);
    } else {
      setTimeout(() => {
        window.location = this.questionCountValue[currentPage + 1];
      }, 10000);
    }
  }
}

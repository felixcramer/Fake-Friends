import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="change-page"
export default class extends Controller {
  static values = { questionCount: Number };
  connect() {
    // setTimeout(() => {
    //   this.changingPage();
    // }, 3000);
    this.questionCountValue;
  }

  changingPage() {
    let url = window.location.href;
    let ending = parseInt(url.slice(-1)) + 1;
    let urlModified = url.substring(0, url.length - 1);
    const finalUrl = urlModified + ending;
    window.location = finalUrl;
  }
}

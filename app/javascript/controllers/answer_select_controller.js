import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="answer-select"
export default class extends Controller {
  static targets = ["button"];
  static values = {
    usernames: Array,
  };

  connect() {
    console.log("Hello from Stimulus");
  }

  select(event) {
    // console.log(event.currentTarget)
    // console.log(event.currentTarget.value)
    // console.log(this.buttonTargets)
    // console.log(this.buttonTargets[event.currentTarget.value - this.index_correct(event.currentTarget.value)]);
    this.buttonTargets.forEach((btn) => {
      btn.classList.remove("active-btn");
    });
    // console.log(typeof (event.currentTarget.value))
    // console.log(this.index_correct(parseInt(event.currentTarget.value)))
    console.log(
      this.buttonTargets[
        parseInt(event.currentTarget.value) -
          this.index_correct(parseInt(event.currentTarget.value))
      ]
    );
    this.buttonTargets[
      parseInt(event.currentTarget.value) -
        this.index_correct(parseInt(event.currentTarget.value))
    ].classList.toggle("active-btn");
  }

  // index_correct(event.currentTarget.value)

  index_correct(number) {
    if (number === 1) {
      return 1;
    }

    if (number === 2) {
      return 1;
    }

    if (number === 3) {
      return 1;
    }

    if (number === 4) {
      return 1;
    }
    if (number === 5) {
      return 5;
    }

    if (number === 6) {
      return 5;
    }

    if (number === 7) {
      return 5;
    }

    if (number === 8) {
      return 5;
    }

    if (number === 9) {
      return 9;
    }

    if (number === 10) {
      return 9;
    }

    if (number === 11) {
      return 9;
    }

    if (number === 12) {
      return 9;
    }

    if (number === 13) {
      return 13;
    }

    if (number === 14) {
      return 13;
    }

    if (number === 15) {
      return 13;
    }

    if (number === 16) {
      return 13;
    }

    // switch (number) {
    //   case 1: return 1; break;
    //   case 2: return 1; break;
    //   case 3: return 1; break;
    //   case 4: return 1; break;
    //   case 5: return 5; break;
    //   case 6: return 5; break;
    //   case 7: return 5; break;
    //   case 8: return 5; break;
    //   case 9: return 9; break;
    //   case 10: return 9; break;
    //   case 11: return 9; break;
    //   case 12: return 9; break;
    // }
  }
}

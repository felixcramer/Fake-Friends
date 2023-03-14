import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-select"
export default class extends Controller {
  static targets = ['button'];

  connect() {
    console.log('Hello from Stimulus');
  }

  select(event) {
    console.log(event.currentTarget)
    console.log(event.currentTarget.value)
    console.log(this.buttonTargets)
    console.log(this.buttonTargets[event.currentTarget.value - 1]);
    this.buttonTargets.forEach((btn) => {
      btn.classList.remove('active-btn')
    })
    this.buttonTargets[event.currentTarget.value - 1].classList.toggle('active-btn');
  }

  // index_correct(event.currentTarget.value)

  // index_correct(number) {
  //   switch (number) {
  //     case 1: return 1; break;
  //     case 2: return 1; break;
  //     case 3: return 1; break;
  //     case 4: return 1; break;
  //     case 5: return 5; break;
  //     case 6: return 5; break;
  //     case 7: return 5; break;
  //     case 8: return 5; break;
  //     case 9: return 9; break;
  //     case 10: return 9; break;
  //     case 11: return 9; break;
  //     case 12: return 9; break;
  //   }
}

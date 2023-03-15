import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="waiting-room-subscription"
export default class extends Controller {
  static targets = ["avatars"];
  static values = {
    waitingroomId: Number,
  };
  connect() {
    createConsumer().subscriptions.create(
      { channel: "WaitingRoomChannel", id: this.waitingroomIdValue },
      {
        received: (data) => {
          this.avatarsTarget.innerHTML = "";
          this.avatarsTarget.insertAdjacentHTML("beforeend", data);
        },
      }
    );
    console.log(
      `Subscribed to the waiting room with the id ${this.waitingroomIdValue}`
    );
  }
}

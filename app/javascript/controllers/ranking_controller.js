import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="ranking"
export default class extends Controller {
  static targets = ["friends"]
  static values = {
    rankingroomId: Number
  }

  connect() {
    createConsumer().subscriptions.create(
      { channel: "RankingRoomChannel", id: this.rankingroomIdValue },
      { received: (data) => console.log(data) }
    )
    console.log(`Subscribed to the waiting room with the id ${this.rankingroomIdValue}`)
  }
}

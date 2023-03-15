import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ranking"
export default class extends Controller {
  static targets = [friends]

  connect() {
  }
}

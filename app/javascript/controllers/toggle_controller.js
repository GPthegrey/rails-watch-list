import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "form" ]

  toggle_form() {
    this.formTarget.classList.toggle('d-none')
  }
}

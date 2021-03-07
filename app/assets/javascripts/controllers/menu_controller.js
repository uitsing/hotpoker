import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["menu"]
  connect() {
    console.log('hello')
  }

  toggle(event) {
    event.preventDefault()

    this.menuTarget.classList.toggle('hidden')
  }
}

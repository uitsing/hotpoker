import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["menu"]
  connect() {
    console.log('hello')
  }

  toggle() {
    console.log('toggle')
    this.menuTarget.classList.toggle('hidden')
  }
}

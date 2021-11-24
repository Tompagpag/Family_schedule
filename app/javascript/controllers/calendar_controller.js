import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["display"];

  connect() {
  }

  display(evt) {
    this.displayTarget.classList.toggle("d-none");
   // evt.currentTarget.querySelector('.details').cl
  }
}

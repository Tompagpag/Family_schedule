import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["updateConflict", "true"];
  static values = { imageTag: String }

  connect() {
    this.trueTargets.forEach((target) => {

      target.closest('.day').classList.add('conflictual');

      if (target.getElementsByClassName('reminder').length === 0) {
        target.insertAdjacentHTML('beforeend', `${this.imageTagValue}`)
      };
    });
  };

  display() {
    this.updateConflictTargets.forEach((div) => {
      if (div.closest('.user-event').classList.contains("true")) {
        div.classList.toggle("d-none")
      }
    })
  };
}

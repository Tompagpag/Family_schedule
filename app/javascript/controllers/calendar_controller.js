import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["updateConflict", "true"];

  connect() {

    this.trueTargets.forEach((target) => {

      target.closest('.day').classList.add('conflictual');

      if (target.getElementsByClassName('iconcareful').length === 0) {
          target.insertAdjacentHTML('beforeend', '<img class="iconcareful" src="https://img.icons8.com/windows/50/fa314a/exclamation-mark.png"/>')
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

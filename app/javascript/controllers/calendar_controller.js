import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["updateConflict", "true"];

  connect() {

    this.trueTargets.forEach((target) => {
      target.closest('.day').classList.add('conflictual');
      target.insertAdjacentHTML('beforeend', '<img class="iconcareful" src="https://img.icons8.com/windows/50/fa314a/exclamation-mark.png"/>')
      if (target.closest('.la-modale').getElementsByClassName('iconconflict').length === 0) {
        target.closest('.la-modale').querySelector('.countevents').insertAdjacentHTML('beforeend', '<img class="iconconflict" src="https://img.icons8.com/windows/50/fa314a/exclamation-mark.png"/>');
      }
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

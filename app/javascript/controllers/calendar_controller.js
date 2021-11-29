import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["updateConflict", "conflict", "true"];

  connect() {

    this.trueTargets.forEach((target) => {
      target.insertAdjacentHTML('beforeend', '<img class="iconcareful" src="https://img.icons8.com/windows/50/fa314a/exclamation-mark.png"/>')
    });

    this.conflictTargets.forEach((conflict) => {
      conflict.closest('.day').classList.add('conflictual');
      if (conflict.closest('.test').getElementsByClassName('iconconflict').length === 0) {
        console.log(conflict.closest('.test').querySelector('.countevents'));
        conflict.closest('.test').querySelector('.countevents').insertAdjacentHTML('beforeend', '<img class="iconconflict" src="https://img.icons8.com/windows/50/fa314a/exclamation-mark.png"/>');
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

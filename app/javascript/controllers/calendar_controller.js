import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["updateConflict", "conflict", "true"];

  connect() {

    this.trueTargets.forEach((target) => {
      target.insertAdjacentHTML('beforeend', '<img class="iconcareful" src="https://img.icons8.com/windows/50/fa314a/exclamation-mark.png"/>')
    })

    this.conflictTargets.forEach((conflict) => {
      if (conflict.closest('.test').getElementsByClassName('fa-car').length === 0) {
        conflict.closest('.test .countevents').insertAdjacentHTML('beforeend', '<img class="attention" src="https://img.icons8.com/material-outlined/50/fa314a/box-important.png"/>');
        conflict.closest('.day').classList.add('conflictual');
      }
    });
  };

  display(event) {
    event.preventDefault();
    this.updateConflictTargets.forEach((div) => {
      if (div.closest('.user-event').classList.contains("true")) {
        div.classList.remove("d-none")
      }
    })
  };

}

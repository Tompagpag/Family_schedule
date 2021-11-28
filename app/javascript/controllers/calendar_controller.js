import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["days", "updateConflict", "conflict"];

  connect() {

    this.conflictTargets.forEach((conflict) => {
      if (conflict.closest('.test').getElementsByClassName('fa-car').length === 0) {
        conflict.closest('.test .eventattention').insertAdjacentHTML('beforeend', '<img class="attention" src="https://img.icons8.com/material-outlined/50/fa314a/box-important.png"/>');
      };
    });
  };

  display(event) {
    console.log(this.updateConflictTargets)
    this.updateConflictTargets.classList.remove("d-none")
  }

  // this.daysTargets.forEach((calendarDay) => {
  //   // console.log(Date.now())
  //   // console.log(calendarDay)
  //   if (date === Date.now()) {
  //     calendarDay.addClass("currentDay")
  //   }
  // });

}

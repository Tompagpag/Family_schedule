import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["display", "conflict"];

  connect() {

    this.conflictTargets.forEach((conflict) => {
      if (conflict.classList.contains('conflict')) {
        conflict.closest('.day').classList.add("parent-conflict-bg");
        // conflict.closest('.day').classList.remove("has-events");
        // conflict.closest('.test').classList.add("test-circle");
      }
    })
  }

  display(evt) {
    this.displayTarget.classList.toggle("d-none");
   // evt.currentTarget.querySelector('.details').cl
  }

  // circle(evt) {
  //   console.log(evt);
  //   this.displayTarget.classList.add("day-number");
  // }
}

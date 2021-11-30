import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["reminderDetails", "test"];

  connect() {
    console.log(this.testTarget.classList.value)
    // if (this.testTarget["value"] === 'true') {
    //   this.reminderDetailsTarget.classList.remove("d-none");
    // }
  };

  addReminder() {

    this.reminderDetailsTarget.classList.toggle("d-none");

  };
}

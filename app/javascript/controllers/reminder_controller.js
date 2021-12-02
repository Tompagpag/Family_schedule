import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["reminderDetails", "test"];

  connect() {
    if (this.testTarget.classList.value.includes("is-valid")) {
      this.reminderDetailsTarget.classList.remove("d-none");
    }
  };

  addReminder() {

    this.reminderDetailsTarget.classList.toggle("d-none");

  };
}

import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["reminderDetails"];

  connect() {
    // console.log("connecté");
  };

  addReminder() {
    this.reminderDetailsTarget.classList.toggle("d-none");
  }
}

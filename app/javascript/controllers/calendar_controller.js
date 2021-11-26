import { end } from "@popperjs/core";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["display", "conflict"];

  connect() {

    this.conflictTargets.forEach((conflict) => {
      if (conflict.classList.contains('transport')) {
        if (conflict.closest('.test').getElementsByClassName('fa-car').length === 0) {
          conflict.closest('.test').insertAdjacentHTML('beforeend', '<i class="fas fa-car"></i>');
        };
      };
      if (conflict.classList.contains('babysitter')) {
        if (conflict.closest('.test').getElementsByClassName('fa-child').length === 0) {
          conflict.closest('.test').insertAdjacentHTML('beforeend', '<i class="fas fa-child"></i>');
        };
      };
    });
  };

}

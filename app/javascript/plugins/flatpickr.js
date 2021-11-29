import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";
import minMaxTimePlugin from "flatpickr/dist/plugins/minMaxTimePlugin";

const initFlatpickr = () => {
  window.addEventListener("turbolinks:load", function() {
    flatpickr('.datepicker', {
      enableTime: true,
      minDate: "2018",
      plugins: [
        new minMaxTimePlugin({
          table: {
            "2021-11-26": {
              minTime: "16:00",
              maxTime: "22:00"
            }
          }
        })
      ]

    });
  });
}

export { initFlatpickr };

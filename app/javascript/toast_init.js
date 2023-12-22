// app/javascript/toast_init.js
document.addEventListener("DOMContentLoaded", function () {
  var toastElList = [].slice.call(document.querySelectorAll(".toast"));
  var toastList = toastElList.map(function (toastEl) {
    return new bootstrap.Toast(toastEl);
  });

  toastList.forEach(function (toast) {
    toast.show();
  });
});

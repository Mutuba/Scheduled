// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "bootstrap";
console.log("All done am fickeed");

document.addEventListener("turbolinks:load", function () {
  $('[data-bs-toggle="modal"]').modal();
});

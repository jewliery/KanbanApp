// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core"


document.addEventListener('turbo:load', function() {
  console.log("turbo:load");
  const toastElList = document.querySelectorAll('.toast');
  console.log(toastElList);
  const toastList = [...toastElList].map(toastEl => new bootstrap.Toast(toastEl, {delay: 2000 }));
  toastList.forEach(toast => toast.show());
});

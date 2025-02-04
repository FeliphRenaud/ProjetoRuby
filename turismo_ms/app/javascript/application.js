// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import Rails from "@rails/ujs";
Rails.start();
window.Rails = Rails; // Expondo o objeto Rails globalmente
console.log("application.js carregado");
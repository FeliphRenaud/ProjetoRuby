// Importa o Rails UJS
import Rails from "@rails/ujs";

// Inicializa o Rails UJS
Rails.start();

// Expondo o objeto Rails globalmente, para poder testá-lo no console
window.Rails = Rails;

console.log("application.js carregado");
console.log("window.Rails:", window.Rails);
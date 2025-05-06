// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

// // Importar Preline - Removido
// import "preline/preline"

// // Inicializar Preline após o carregamento inicial da página - Removido
// // (Pode ser necessário ajustar dependendo de como o Turbo interage)
// document.addEventListener("turbo:load", () => {
//   HSStaticMethods.autoInit();
// });

// // Considerar também inicializar em turbo:render se houver problemas com navegação Turbo - Removido
// // document.addEventListener("turbo:render", () => {
// //   HSStaticMethods.autoInit();
// // });

// // Inicialização fallback caso Turbo não esteja presente ou para a primeira carga - Removido
// if (typeof HSStaticMethods !== 'undefined') {
//   HSStaticMethods.autoInit();
// }

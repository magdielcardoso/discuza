import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = [ "menu" ]
  // Controla se o menu está aberto
  isOpen = false

  connect() {
    this.boundHide = this.hide.bind(this)
    document.addEventListener("click", this.boundHide, true) // Use capturing phase
  }

  disconnect() {
    document.removeEventListener("click", this.boundHide, true)
  }

  toggle(event) {
    // Impede que o clique no trigger feche o menu imediatamente (capturing phase)
    event.stopPropagation()

    this.isOpen = !this.isOpen
    if (this.isOpen) {
      this.openMenu()
    } else {
      this.closeMenu()
    }
  }

  openMenu() {
    this.menuTarget.classList.remove("hidden")
    // Força reflow para garantir que a transição funcione
    void this.menuTarget.offsetWidth;
    this.menuTarget.classList.add("opacity-100")
    this.menuTarget.classList.remove("opacity-0")
    this.isOpen = true
  }

  closeMenu() {
    this.menuTarget.classList.remove("opacity-100")
    this.menuTarget.classList.add("opacity-0")
    // Esconde após a transição
    setTimeout(() => {
      this.menuTarget.classList.add("hidden")
    }, 300) // Deve corresponder à duração da transição em ms
    this.isOpen = false
  }

  hide(event) {
    // Fecha somente se estiver aberto e o clique for fora do elemento do controller
    if (this.isOpen && !this.element.contains(event.target)) {
      this.closeMenu()
    }
  }
}

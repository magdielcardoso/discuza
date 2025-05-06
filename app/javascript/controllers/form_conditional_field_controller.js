import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-conditional-field"
export default class extends Controller {
  static targets = [ "statusRadio", "conditionalElement" ]

  connect() {
    this.toggle()
  }

  toggle() {
    // Encontra qual radio button está selecionado
    const selectedRadio = this.statusRadioTargets.find(radio => radio.checked)
    
    // Mostra o elemento condicional apenas se 'not_resolved' estiver selecionado
    if (selectedRadio && selectedRadio.value === 'not_resolved') {
      this.conditionalElementTarget.classList.remove('hidden')
      // Opcional: tornar o campo required
      // this.conditionalElementTarget.querySelector('textarea, input')?.setAttribute('required', 'required');
    } else {
      this.conditionalElementTarget.classList.add('hidden')
      // Opcional: remover o required
      // this.conditionalElementTarget.querySelector('textarea, input')?.removeAttribute('required');
      // Opcional: limpar o valor do campo ao esconder
      // const input = this.conditionalElementTarget.querySelector('textarea, input');
      // if (input) input.value = ''; 
    }
  }
} 
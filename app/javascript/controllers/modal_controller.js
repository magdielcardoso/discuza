import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "modal", "closeModal", "deleteModal", "profileModal", "passwordField" ]

  connect() {
    console.log("ModalController connected", this.element)
    // Listener para fechar com ESC
    this.escapeListener = (event) => {
      if (event.key === "Escape") {
        this.close(event) // Passa o evento para evitar comportamento padrão se necessário
      }
    }
    document.addEventListener("keydown", this.escapeListener)
    
    // Remover listener antigo se existir (precaução)
    if (this.boundHandleKeyup) {
      document.removeEventListener("keyup", this.boundHandleKeyup)
    }
  }

  disconnect() {
    console.log("ModalController disconnected")
    document.removeEventListener("keydown", this.escapeListener)
  }

  // Ação específica para abrir o modal de PERFIL (Simplificada)
  openProfileModal() {
    console.log("[openProfileModal] Simplified action triggered.");
    if (this.hasProfileModalTarget) {
      this.profileModalTarget.classList.remove('hidden')
      this.profileModalTarget.classList.add('flex')
      console.log("[openProfileModal] Classes set to:", this.profileModalTarget.className);
      
      // Tentar focar diretamente
      if (this.hasPasswordFieldTarget) {
        try {
           this.passwordFieldTarget.focus();
           console.log("[openProfileModal] passwordFieldTarget focus attempted.");
        } catch (e) {
           console.error("[openProfileModal] Error focusing password field:", e);
        }
      } else {
         console.warn("[openProfileModal] passwordFieldTarget not found for focus.");
      }
    } else {
      console.warn("[openProfileModal] profileModalTarget not found.");
    }
  }

  // Ação específica para abrir o modal de FECHAMENTO
  openCloseModal() {
    if (this.hasCloseModalTarget) {
      this.closeModalTarget.classList.remove('hidden')
      this.closeModalTarget.classList.add('flex')
    }
  }

  // Ação específica para abrir o modal de EXCLUSÃO
  openDeleteModal() {
    if (this.hasDeleteModalTarget) {
      this.deleteModalTarget.classList.remove('hidden')
      this.deleteModalTarget.classList.add('flex')
    }
  }

  // Fecha QUALQUER modal que esteja visível (Removida verificação isOpening)
  close(event) {
    if (event) event.preventDefault()
    console.log("ModalController close() action triggered")

    let closedSomething = false
    // Adicionar verificação e fechamento para o modal de perfil
    if (this.hasProfileModalTarget && !this.profileModalTarget.classList.contains('hidden')) {
      this.profileModalTarget.classList.add('hidden')
      this.profileModalTarget.classList.remove('flex')
      closedSomething = true
    }
    if (this.hasCloseModalTarget && !this.closeModalTarget.classList.contains('hidden')) {
      this.closeModalTarget.classList.add('hidden')
      this.closeModalTarget.classList.remove('flex')
      closedSomething = true
    }
    if (this.hasDeleteModalTarget && !this.deleteModalTarget.classList.contains('hidden')) {
      this.deleteModalTarget.classList.add('hidden')
      this.deleteModalTarget.classList.remove('flex')
      closedSomething = true
    }

    if (closedSomething && this.hasPasswordFieldTarget) {
        this.clearPasswordField() // Limpa senha se fechou um modal relevante
    }
    
    // Removida a lógica antiga que dependia de this.modalTarget e animações
  }
  
  // Restaurar lógica original de closeWithBackground que verifica o target
  closeWithBackground(event) {
     console.log("ModalController closeWithBackground() triggered")
     // Verifica se o clique foi diretamente no backdrop (elemento que tem o data-modal-target)
     // e não em um filho dele (como o card do modal).
     // Precisamos encontrar o target correto (profileModal, closeModal, deleteModal)
     let targetModal = null;
     if (this.hasProfileModalTarget && event.target === this.profileModalTarget) {
        targetModal = this.profileModalTarget;
     } else if (this.hasCloseModalTarget && event.target === this.closeModalTarget) {
        targetModal = this.closeModalTarget;
     } else if (this.hasDeleteModalTarget && event.target === this.deleteModalTarget) {
        targetModal = this.deleteModalTarget;
     }

     if (targetModal) {
        console.log("Closing modal because background was clicked.")
        this.close() // Chama a função close genérica que sabe qual target fechar
     } else {
       console.log("Click was not directly on a known modal backdrop, not closing.")
     }
  }

  // Previne que o clique no card do modal feche o modal
  preventBackgroundClose(event) {
    event.stopPropagation()
  }

  // Limpa o campo de senha (mantido)
  clearPasswordField() {
    console.log("ModalController clearPasswordField() called")
    if (this.hasPasswordFieldTarget) {
      this.passwordFieldTarget.value = ''
      console.log("Password field cleared")
    } else {
      // console.log("Password field target not found for clearing") // Comentado para reduzir ruído
    }
  }

  // Função submitForm - ajustada para fechar o modal genérico
  submitForm() {
     console.log("ModalController submitForm() action triggered - Ensure this is intended for the correct form")
     // ... (código submitForm existente) ...
     const mainForm = document.getElementById("edit_user_form")
     if (!mainForm) {
       console.error("Formulário principal #edit_user_form não encontrado!")
       return
     }

     // Verificar se o passwordFieldTarget existe antes de acessá-lo
     if (!this.hasPasswordFieldTarget) {
       console.error("Campo de senha (passwordField target) não encontrado no modal!")
       return
     }
     const currentPassword = this.passwordFieldTarget.value

     console.log("Current password entered:", currentPassword ? '******' : 'EMPTY')
     if (currentPassword === "") {
       alert("Por favor, digite sua senha atual.")
       this.passwordFieldTarget.focus()
       console.log("Password validation failed: empty")
       return
     }

     // Remove campo oculto anterior, se existir
     const existingHiddenInput = mainForm.querySelector("input[name='user[current_password]'][type='hidden']")
     if (existingHiddenInput) {
       console.log("Removing existing hidden current_password field")
       existingHiddenInput.remove()
     }

     // Cria um campo hidden para a senha atual dentro do form principal
     console.log("Creating hidden current_password field")
     const hiddenInput = document.createElement("input")
     hiddenInput.setAttribute("type", "hidden")
     hiddenInput.setAttribute("name", "user[current_password]")
     hiddenInput.setAttribute("value", currentPassword)
     mainForm.appendChild(hiddenInput)

     // Fecha o modal genérico ANTES de submeter
     // Usar this.modalTarget diretamente
     if (this.hasModalTarget && !this.modalTarget.classList.contains('hidden')) {
       console.log("Closing the generic modal before submitting form")
       // Chama a função close() refatorada para garantir limpeza e lógica correta
       this.close()
     } else {
        console.warn("Generic modal target was not found or not open when trying to close before submit.")
     }

     // Pequeno delay para garantir que o modal fechou visualmente antes do submit (opcional)
     setTimeout(() => {
       console.log("Requesting main form submission...")
       mainForm.requestSubmit() // Use requestSubmit() para acionar validações HTML5 e eventos
     }, 50); // Delay mínimo
   }
}

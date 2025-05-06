class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Define o layout baseado no tipo de controller (Devise ou aplicação)
  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Escolhe o layout: 'application' para devise/registrations#edit, 'auth' para outros Devise, 'application' para o resto
  def layout_by_resource
    if devise_controller?
      if resource_name == :user && action_name == 'edit' # Ou controller_name == 'registrations' && action_name == 'edit'
        "application"
      else
        "auth"
      end
    else
      "application"
    end
  end

  def configure_permitted_parameters
    # Permitir :name e :avatar nos parâmetros de sign_up e account_update
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :current_password]) # current_password já deve ser permitido por padrão, mas garantimos
  end
end

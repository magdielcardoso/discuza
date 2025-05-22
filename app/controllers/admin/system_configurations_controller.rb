class Admin::SystemConfigurationsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!
  before_action :set_system_configuration

  def show
    # Shows current system configuration
  end

  def edit
    # Edit form for system configuration
  end

  def update
    if @system_configuration.update(system_configuration_params)
      redirect_to admin_system_configuration_path,
                  notice: "Configura\u00E7\u00F5es do sistema atualizadas com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_system_configuration
    @system_configuration = SystemConfiguration.instance
  end

  def system_configuration_params
    params.require(:system_configuration).permit(
      :site_name,
      :site_description,
      :contact_email,
      :logo
    )
  end

  def ensure_admin!
    redirect_to root_path, alert: "Acesso n\u00E3o autorizado." unless current_user&.is_admin?
  end
end

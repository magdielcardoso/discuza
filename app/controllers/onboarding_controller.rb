class OnboardingController < ApplicationController
  layout false # No layout for onboarding

  before_action :check_if_users_exist # This will redirect to root_path if User.exists?

  def index
    @user = User.new
    # Try to load existing or initialize with defaults
    @system_config = SystemConfiguration.first || SystemConfiguration.new(
      site_name: "Discuza",
      site_description: "Uma plataforma para compartilhar conhecimento e experiências.",
      contact_email: "contato@discuza.app",
      primary_color: "lime"
    )
    # Ensure primary_color has a default for the view if loaded record had none
    @system_config.primary_color ||= "lime"
  end

  def create
    @user = User.new(user_params)
    # Find existing or initialize a new one. This aims to update the first record or create it.
    @system_config = SystemConfiguration.first_or_initialize
    @system_config.assign_attributes(system_config_params)

    # Validate both objects
    user_valid = @user.valid?
    system_config_valid = @system_config.valid?

    if user_valid && system_config_valid
      # Start transaction to ensure both are saved or none
      User.transaction do
        # Set the user as admin
        @user.is_admin = true
        @user.save!

        # Save system configuration
        @system_config.save!

        # Sign in the newly created user
        sign_in(@user)

        redirect_to root_path, notice: "Welcome! Your account and system have been configured successfully."
      end
    else
      # Errors will be displayed by iterating @user.errors and @system_config.errors in the view
      render :index, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordInvalid => e
    # Add a generic error to @system_config or @user, or handle more gracefully
    # For now, adding to @system_config as a fallback
    @system_config.errors.add(:base, "An error occurred during setup: #{e.message}")
    render :index, status: :unprocessable_entity
  end

  private

  def check_if_users_exist
    redirect_to root_path if User.exists?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def system_config_params
    params.require(:system_configuration).permit(:site_name, :site_description, :contact_email, :logo, :primary_color)
  end
end

class AccountRegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    super
  end

  def create
  	super
  end

  def update
    super
  end
  
protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
    			:username, :firstname, :surname, 
    			:gender, :date_of_birth, :password_confirmation,
    			:password, :email
    			)}
  end
end 
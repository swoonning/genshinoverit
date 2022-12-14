class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :initialize_session
    before_action :load_cart


  private

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    @cart = Character.find(session[:cart])
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
  end
end

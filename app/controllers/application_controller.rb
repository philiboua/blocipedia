class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  rescue_from Pundit::NotAuthorizedError do |exception|
     redirect_to root_url, alert: exception.message
   end

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
   end



   def after_sign_up_path_for(resource)
    wikis_path
  end
end

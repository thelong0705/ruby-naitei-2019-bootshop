class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_categories
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end
  
  def get_categories
    @categories = Category.all
  end
end

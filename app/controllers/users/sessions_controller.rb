# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def new
    redirect_to root_url
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in_and_redirect(resource_name, resource)
  end

  def sign_in_and_redirect resource_or_scope, resource
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    respond_to do |format|
      format.json{render json: {success: true}}
    end
  end

  def failure
    warden.custom_failure!
    respond_to do |format|
      format.json{render json: {success: false}}
    end
  end

  protected

  def auth_options
    {scope: resource_name, recall: "#{controller_path}#failure"}
  end
end

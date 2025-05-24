class Users::SessionsController < Devise::SessionsController
  def create
    if sign_in_params[:email].blank?
      self.resource = resource_class.new(sign_in_params)
      resource.errors.add(:email, :blank)
      respond_with resource, location: new_user_session_path
      return
    end

    if sign_in_params[:password].blank?
      self.resource = resource_class.new(sign_in_params)
      resource.errors.add(:password, :blank)
      respond_with resource, location: new_user_session_path
      return
    end

    # Проверяем существование пользователя
    user = User.find_by(email: sign_in_params[:email].downcase)
    if user.nil?
      self.resource = resource_class.new(sign_in_params)
      resource.errors.add(:base, :user_not_found)
      respond_with resource, location: new_user_session_path
      return
    end

    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  rescue Warden::AuthenticationError
    self.resource = resource_class.new(sign_in_params)
    resource.errors.add(:base, :invalid_credentials)
    respond_with resource, location: new_user_session_path
  end
end

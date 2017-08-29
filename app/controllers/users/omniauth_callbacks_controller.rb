class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  private

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope      = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    # redirect_to stored_location_for(scope) || after_sign_in_path_for(resource)
    render :json => {:status => :signed_in}
  end
  
  
  def sign_out_and_redirect(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    if Devise.sign_out_all_scopes
      sign_out_all_scopes
    else
      sign_out(scope)
    end
    #redirect_to after_sign_out_path_for(scope)
    render :json => {:status => :signed_out}
  end
end
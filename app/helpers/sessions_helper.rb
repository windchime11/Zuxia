module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def signed_in?
    !current_user.nil?
  end

  def deny_access
    store_location
    flash[:notice] = "Please Sign in to access the page"
    redirect_to signin_path 
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_user?(user)
    user == current_user
  end

  #signed_in? method is defined in app/helpers/sessions_helper.rb
  #deny_access method is also defined in app/helpers/sessions_helper.rb 
  #listing 10.11
  #one method can not have two redirect_to
  def authenticate
    deny_access unless signed_in?
  end


  private 

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] ||[nil, nil]
    end
  
    def store_location
      session[:return_to] = request.fullpath
    end

end

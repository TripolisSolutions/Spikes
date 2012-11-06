module SessionsHelper

  # @param [Object] user
  def sign_in(user)
    # Sign the user in
    session[:user_id] = user.id
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      sign_out
    end
  end

  def sign_out
    session[:user_id] = nil
  end

end
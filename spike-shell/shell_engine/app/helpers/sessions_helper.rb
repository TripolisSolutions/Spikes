  module SessionsHelper

    # @param [Object] user
    def sign_in(user)
      @current_user = user
      cookies.permanent[:shell_user_id] = @current_user.id
    end

    def sign_out
      cookies.delete(:shell_user_id)
      @current_user = nil
    end

    def signed_in?
      !current_user.nil?
    end

    def current_user
      @current_user ||= fetch_user
    end

    def fetch_user
      user_id = cookies[:shell_user_id]
      if !user_id.nil?
        User.find(user_id)
      end
    end

    def active_theme
      @active_theme = cookies[:shell_theme] ||= 'default'
    end

    def switch_theme_to(theme_name)
      @active_theme = theme_name
      cookies.permanent[:shell_theme] = theme_name
    end

  end



class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:session][:email])
    if user
      sign_in user
      redirect_to root_path
    else
      # Create an error message and re-render the dashboard form.
      flash[:error] = 'Invalid email. Hint: Look at the user list!' # Not quite right!
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end

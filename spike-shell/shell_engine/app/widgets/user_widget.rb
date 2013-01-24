class UserWidget < Apotomo::Widget

  def display
    @users = User.all
    render
  end

end

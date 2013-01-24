class MainWidget < Apotomo::Widget

  def display
    self << widget(:user)
    render
  end

end

class HeaderWidget < Apotomo::Widget

  def display
    self << widget(:navigation)
    render
  end

end

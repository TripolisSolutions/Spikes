class HeaderWidget < Apotomo::Widget

  def display
    self << widget(:navigation)
    if parent_controller.signed_in?
      self << widget(:signout)
    end
    render
  end

end

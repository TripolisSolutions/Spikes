class SessionWidget < Apotomo::Widget

  def display
    if parent_controller.signed_in?
      self << widget(:signout)
    else
      self << widget(:signin)
    end
    render
  end

end

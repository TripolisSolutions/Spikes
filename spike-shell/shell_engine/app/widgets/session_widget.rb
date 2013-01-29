class SessionWidget < Apotomo::Widget

  def display
    self << widget(:signin) unless parent_controller.signed_in?
    render
  end

end

class SidebarWidget < Apotomo::Widget

  has_widgets do |me|
    me << widget(:session)
    if parent_controller.signed_in?
      me << widget(:idea_form)
    end
    me << widget(:user)
  end

  def display
    render
  end

end

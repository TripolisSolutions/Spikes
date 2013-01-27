class MainWidget < Apotomo::Widget

  has_widgets do |me|
    me << widget(:idea_list)
  end

  def display
    render
  end

end

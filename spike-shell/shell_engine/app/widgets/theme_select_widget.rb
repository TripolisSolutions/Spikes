class ThemeSelectWidget < Apotomo::Widget

  def display
    @themes = {default: 'Default', amelia: 'Amelia', spruce: 'Spruce', journal: 'Journal', slate: 'Slate', cyborg: 'Cyborg'}
    @selected_theme = parent_controller.active_theme
    render
  end

end

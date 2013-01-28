class IdeaListWidget < Apotomo::Widget

  responds_to_event :newIdea, :with => :update, :passing => :root

  def display
    @ideas = Idea.all
    render
  end

  def update(evt)
    list_item = escape_js(render :view => :idea, :locals => {:idea => evt[:idea]})
    render :text => "$('##{widget_id} table').append(\"#{list_item}\")"
  end

end

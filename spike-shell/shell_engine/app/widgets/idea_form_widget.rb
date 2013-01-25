class IdeaFormWidget < Apotomo::Widget

  responds_to_event :submit

  def display
    render
  end

  def submit(evt)
    new_idea = parent_controller.current_user.ideas.create(:text => evt[:idea][:text])
    trigger :newIdea, :idea => new_idea
    replace :view => :display
  end

end

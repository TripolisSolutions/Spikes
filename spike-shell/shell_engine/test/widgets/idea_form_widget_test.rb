require 'test_helper'

class IdeaFormWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:idea_form)
  end
  
  test "display" do
    render_widget :idea_form
    assert_select "h1"
  end
end

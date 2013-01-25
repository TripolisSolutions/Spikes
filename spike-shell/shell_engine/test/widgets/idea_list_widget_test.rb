require 'test_helper'

class IdeaListWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:idea_list)
  end
  
  test "display" do
    render_widget :idea_list
    assert_select "h1"
  end
end

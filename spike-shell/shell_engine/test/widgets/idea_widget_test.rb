require 'test_helper'

class IdeaWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:idea)
  end
  
  test "display" do
    render_widget :idea
    assert_select "h1"
  end
end

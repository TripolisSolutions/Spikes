require 'test_helper'

class AboutmeWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:aboutme)
  end
  
  test "display" do
    render_widget :aboutme
    assert_select "h1"
  end
end

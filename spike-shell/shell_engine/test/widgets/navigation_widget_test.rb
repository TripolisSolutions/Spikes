require 'test_helper'

class NavigationWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:navigation)
  end
  
  test "display" do
    render_widget :navigation
    assert_select "h1"
  end
end

require 'test_helper'

class SidebarWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:sidebar)
  end
  
  test "display" do
    render_widget :sidebar
    assert_select "h1"
  end
end

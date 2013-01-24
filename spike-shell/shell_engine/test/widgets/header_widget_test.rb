require 'test_helper'

class HeaderWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:header)
  end
  
  test "display" do
    render_widget :header
    assert_select "h1"
  end
end

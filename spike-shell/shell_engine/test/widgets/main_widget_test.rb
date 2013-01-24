require 'test_helper'

class MainWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:main)
  end
  
  test "display" do
    render_widget :main
    assert_select "h1"
  end
end

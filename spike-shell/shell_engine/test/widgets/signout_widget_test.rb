require 'test_helper'

class SignoutWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:signout)
  end
  
  test "display" do
    render_widget :signout
    assert_select "h1"
  end
end

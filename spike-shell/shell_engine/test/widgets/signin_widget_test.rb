require 'test_helper'

class SigninWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:signin)
  end
  
  test "display" do
    render_widget :signin
    assert_select "h1"
  end
end

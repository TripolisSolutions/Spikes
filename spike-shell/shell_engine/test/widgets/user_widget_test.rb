require 'test_helper'

class UserWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:user)
  end
  
  test "display" do
    render_widget :user
    assert_select "h1"
  end
end

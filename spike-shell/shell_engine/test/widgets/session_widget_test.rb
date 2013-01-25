require 'test_helper'

class SessionWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:session)
  end
  
  test "display" do
    render_widget :session
    assert_select "h1"
  end
end

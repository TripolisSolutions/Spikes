require 'test_helper'

class IdealistWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:idealist)
  end
  
  test "display" do
    render_widget :idealist
    assert_select "h1"
  end
end

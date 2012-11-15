require 'spec_helper'

describe Page_info do

  before do
    @page_info = Page_info.new("http://www.tripolis.com")
  end

  subject{ @page_info }


  it {should respond_to(:url)}
  it {should respond_to(:title)}
  it {should respond_to(:description)}
  it {should respond_to(:images)}

end
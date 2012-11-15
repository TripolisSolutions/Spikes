require 'spec_helper'

describe PageInfo do

  before do
    @page_info = PageInfo.new("http://www.tripolis.com")
  end

  subject{ @page_info }


  it {should respond_to(:url)}
  it {should respond_to(:title)}
  it {should respond_to(:description)}
  it {should respond_to(:images)}

end
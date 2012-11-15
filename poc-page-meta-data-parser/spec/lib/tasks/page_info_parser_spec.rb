# encoding: UTF-8

require 'spec_helper'
require 'webmock/rspec'

describe PageInfoParser do

  before :each do
    stub_request(:get, /.*example.*/).to_return do |request|
      response = IO.read("#{Rails.root}/spec/fixtures#{request.uri.path.to_s}")
      {:body => response, :status => 200}
    end
  end

  describe "valid html page using good_page.html" do

    before :each do
      @test_url = "#{Rails.root}/spec/fixtures/good_page.html"
      @page_info = PageInfoParser.new(@test_url).page_info
    end

    subject{ @page_info }

    describe "should return the correct page meta-data" do
      it "should return the correct page meta-data" do
        @page_info.title.should == "Good page title"
        @page_info.description.should == "This is an example of a meta description."
      end

      it "should have two images larger than 50x50" do
        @page_info.images.length.should == 2
      end
    end

  end

  describe "page using Open Graph tags" do

    before do
      @test_url = "#{Rails.root}/spec/fixtures/og_page.html"
      @page_info = PageInfoParser.new(@test_url).page_info
    end

    subject{ @page_info }

    describe "should return the correct page open graph meta-data" do
      it "should return the correct page meta-data" do
        @page_info.title.should == "Open Graph title"
        @page_info.description.should == "This is an example of an Open Graph meta description."
      end
    end

    it "should have two images larger than 50x50" do
      @page_info.images.length.should == 2
    end

  end

end
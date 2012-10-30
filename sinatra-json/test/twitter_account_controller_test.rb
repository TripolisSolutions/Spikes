require_relative '../app'
require_relative '../app/controllers/twitter_account_controller'
require 'test/unit'
require 'json'
require "rack/test"

ENV['RACK_ENV'] = 'development'

class TwitterAccountControllerTest  < Test::Unit::TestCase
  include Rack::Test::Methods


  def app
    App.new
    #TwitterAccount.all.destroy #will clear all entries
  end

  def test_create
    post '/twitter_accounts/new.json', {:username => "Martijn",:full_name =>"Martijn Schouwe",:status =>"ACTIVE",:token=>"fdsfdsfsdf"}.to_json
    #puts "RESPONSE: " << last_response.body
    ta = TwitterAccount.from_json(last_response.body)
    assert last_response.ok?

    assert_equal(ta.username,"Martijn")
    assert_equal(ta.full_name,"Martijn Schouwe")
    assert_equal(ta.status,"ACTIVE")
  end


  def test_get_by_id
    ta = TwitterAccount.last
    get "/twitter_accounts/1.json" << ta.id.to_s
    assert last_response.ok?
    ta = TwitterAccount.from_json(last_response.body)
    assert_equal("Martijn",ta.username)
    assert_equal(ta.full_name,"Martijn Schouwe")
    assert_equal(ta.status,"ACTIVE")
    assert_e
  end

  def test_get_all
    #TwitterAccount.all.destroy #will clear all entries
    test_create #create an entry
    get "/twitter_accounts.json"
     assert last_response.ok?
      JSON.load(last_response.body).each do |var, val|
        ta = TwitterAccount.from_json(var.to_json)
        assert_equal(ta.username,"Martijn")
        assert_equal(ta.full_name,"Martijn Schouwe")
        assert_equal(ta.status,"ACTIVE")
      end
  end
end

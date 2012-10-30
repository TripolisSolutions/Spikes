require 'sinatra'
require 'json'
require_relative '../../app/models/twitter_account'

# Get a list of twitter accounts
get '/twitter_accounts.json' do
  content_type :json
  ta =  TwitterAccount.all
  puts ta.to_json
  ta.to_json
end


# Delete the twitter accounts
delete '/twitteraccounts' do
end

# Get a twitter account
get '/twitter_accounts/:id.json' do |id|
  twitter_account = TwitterAccount.find(id)
  twitter_account.to_json
end

##
#jQuery.ajax({
#                type: 'POST',
#                url: 'http://localhost.com:4568/twitteraccounts/new',
#                data: JSON.stringify({"username":"Martijn","full_name":"Martijn Schouwe","status":"ACTIVE","token":"fdsfdsfsdf"}),
#    dataType: 'json'
#});
# Create a twitter account
post '/twitter_accounts.json' do
  content_type :json
  js = JSON.parse(request.body.read)
  twitter_account = TwitterAccount.new(js["twitter_account"])
  if twitter_account.save
    twitter_account.to_json
  else
    error 400, "Error saving you twitter account"
  end
end

# Replace the twitter account
put '/twitter_accounts/:id.json' do  |id|
    js = JSON.parse(request.body.read)
    puts js.class

    puts js["twitter_account"]
    ta = TwitterAccount.find(id)
    ta.update_attributes(js["twitter_account"])
end

# Delete a twitter account
delete '/twitter_accounts/:id.json' do |id|
  begin
    twitter_account = TwitterAccount.find(id)  #get! raises an objectnotfounderror when object is not found without its doesnt
    twitter_account.destroy
  rescue ObjectNotFoundError
    error 400, "Error object not found"
  end
end
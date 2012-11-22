class LoadContactsTask < ApiLimitTask
  @queue = :twitter_contacts_load

  def self.perform_task(uids)
    users = client.users(uids)
    users.each do |u|
      contact = Contact.where(uid: u.attrs[:id]).first
      contact.name = u.attrs[:screen_name]
      contact.location = u.attrs[:location]
      contact.avator_url = u.attrs[:profile_image_url]
      contact.real_name = u.attrs[:name]
      contact.description = u.attrs[:description]
      contact.last_update = Time.now
      contact.save
    end
  end

  def self.client
    u = User.first
    Twitter::Client.new(consumer_key: config.consumer_key,
                        consumer_secret: config.consumer_secret,
                        oauth_token: u.oauth_token,
                        oauth_token_secret: u.oauth_secret)
  end

  def self.config
    SimpleConfig.for :twitter
  end
end

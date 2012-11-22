class LoadFollowerIdsTask < ApiLimitTask
  @queue = :twitter_follower_ids
  @api_name = "twitter/follower_ids"

  # FIXME Add Unfollow handling
  def self.perform_task(id, cursor = -1)
    uf = UserFollower.find(id)
    fs = client.follower_ids(uf.twitter_id, cursor: cursor)
    puts "Adding contacts"
    UserFollower.transaction do
      cid = uf.contact_ids
      fs.collection.each_with_index do |id, idx|
        c = Contact.for_uid(id) # Create/use existant
        cid << c.id
        # contact with specific_id
        puts idx if idx % 100 == 0
      end
      uf.contact_ids = cid.uniq
    end
    puts "Done"
    unless fs.last?
      p fs.next_cursor
      Resque.enqueue(self, id, fs.next_cursor)
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

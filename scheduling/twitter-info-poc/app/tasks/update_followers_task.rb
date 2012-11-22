class UpdateFollowersTask < ApiLimitTask
  @queue = :twitter

  @children_queues = [:twitter_follower_ids]

  def self.perform_task
    UserFollower.where(last_loaded: nil).each do |f|
      Resque.enqueue(LoadFollowerIdsTask, f.id)
    end
  end
end

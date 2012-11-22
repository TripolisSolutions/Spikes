class RefreshContactsTask < ApiLimitTask
  @queue = :twitter

  def self.perform_task
    Contact.where(name: nil).select([:uid, :id]).find_in_batches(batch_size: 100) do |group|
      Resque.enqueue(LoadContactsTask, group.map(&:uid))
    end
  end
end

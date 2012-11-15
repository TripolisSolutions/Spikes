class RemovePublishDateFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :publish_date
      end

  def down
    add_column :posts, :publish_date, :datetime
  end
end

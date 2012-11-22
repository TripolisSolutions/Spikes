class CreateUserFollowersContactsJoinTable < ActiveRecord::Migration
  def change
    create_table :user_followers_contacts do |t|
      t.integer :user_follower_id
      t.integer :contact_id
    end
  end
end

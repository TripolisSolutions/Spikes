class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :status
      t.string :status_id
      t.timestamps
    end
  end
end

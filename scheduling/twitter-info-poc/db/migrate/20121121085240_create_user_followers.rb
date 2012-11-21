class CreateUserFollowers < ActiveRecord::Migration
  def change
    create_table :user_followers do |t|
      t.column :user_id, :integer
      t.column :twitter_id, "bigint"

      t.integer :last_loaded
      t.string :status

      t.timestamps
    end
  end
end

class CreateFacebookPosts < ActiveRecord::Migration
  def change
    create_table :facebook_posts do |t|
      t.integer :account_id
      t.string :label
      t.string :status
      t.string :type
      t.text :post
      t.datetime :post_at

      t.timestamps
    end
  end
end

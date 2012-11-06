class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userId
      t.string :name
      t.string :realName
      t.string :location
      t.string :description
      t.string :avatarUrl
      t.string :oauth_token
      t.string :oauth_secret
      t.timestamps
    end
  end
end

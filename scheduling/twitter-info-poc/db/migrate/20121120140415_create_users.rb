class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :uid, "bigint"
      t.string :name
      t.string :oauth_token
      t.string :oauth_secret

      t.timestamps
    end
    add_index :users, [:uid]
  end
end

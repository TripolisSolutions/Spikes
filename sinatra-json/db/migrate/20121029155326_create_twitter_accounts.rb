class CreateTwitterAccounts < ActiveRecord::Migration
  def up
    create_table :twitter_accounts do |t|
      t.string :username
      t.string :full_name
      t.string :token
      t.boolean :enabled
      t.string :status
    end
  end

  def down
    drop_table :twitter_accounts
  end
end

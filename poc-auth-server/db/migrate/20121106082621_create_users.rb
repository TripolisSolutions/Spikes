class CreateUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string
    create_table :users do |t|
      t.integer :client_id
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end

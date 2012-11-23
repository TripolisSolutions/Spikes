class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.column :uid, "bigint"
      t.integer :followers_count
      t.string :name
      t.string :location
      t.string :avator_url
      t.string :real_name
      t.string :description
      t.datetime :last_update

      t.timestamps
    end
  end
end

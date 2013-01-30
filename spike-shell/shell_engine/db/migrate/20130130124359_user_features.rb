class UserFeatures < ActiveRecord::Migration
  def up
    add_column :users, :features, :string
  end

  def down
    remove_column :users, :features
  end
end

# This migration comes from shell_engine_engine (originally 20130130124359)
class UserFeatures < ActiveRecord::Migration
  def up
    add_column :users, :features, :string
  end

  def down
    remove_column :users, :features
  end
end

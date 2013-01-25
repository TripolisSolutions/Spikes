class CreateDatabases < ActiveRecord::Migration
  using_all_shards

  def change
    create_table :databases do |t|
      t.string :url
      t.boolean :active

      t.timestamps
    end
  end
end

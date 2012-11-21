class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :user_id
      t.string :name
      t.string :country
      t.string :place_type
      t.integer :woeid
      t.timestamps
    end
  end
end

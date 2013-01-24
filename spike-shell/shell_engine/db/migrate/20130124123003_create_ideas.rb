class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :text
      t.integer :user_id
      t.boolean :liked

      t.timestamps
    end
  end
end

class CreateFacebookMessages < ActiveRecord::Migration
  def change
    create_table :facebook_messages do |t|
      t.message
      t.timestamps
    end
  end
end

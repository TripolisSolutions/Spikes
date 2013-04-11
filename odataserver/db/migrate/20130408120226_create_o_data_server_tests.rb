class CreateODataServerTests < ActiveRecord::Migration
  def change
    create_table :o_data_server_tests do |t|
      t.string :name

      t.timestamps
    end
  end
end

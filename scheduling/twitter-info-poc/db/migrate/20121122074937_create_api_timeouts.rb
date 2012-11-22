class CreateApiTimeouts < ActiveRecord::Migration
  def change
    create_table :api_timeouts do |t|
      t.string :api
      t.datetime :reset_time

      t.timestamps
    end
  end
end

class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :redirect_uri

      t.timestamps
    end
  end
end

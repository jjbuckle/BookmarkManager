class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :url
      t.string :loginurl
      t.timestamps
    end
  end
end

class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :short_url
      t.string :url

      t.timestamps null: false
    end
    add_index :urls, :short_url, unique: true
  end
end

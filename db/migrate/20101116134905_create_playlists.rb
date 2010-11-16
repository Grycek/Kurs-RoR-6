class CreatePlaylists < ActiveRecord::Migration
  def self.up
    create_table :playlists do |t|
      t.string :name
      t.string :author
      t.date :date
      t.text :list

      t.timestamps
    end
  end

  def self.down
    drop_table :playlists
  end
end

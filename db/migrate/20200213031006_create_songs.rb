class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.datetime :released_at
      t.string :artist_name
      t.float :rating

      t.timestamps
    end
  end
end

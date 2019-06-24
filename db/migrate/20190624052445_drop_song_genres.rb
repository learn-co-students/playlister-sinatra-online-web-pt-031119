class DropSongGenres < ActiveRecord::Migration[5.2]
  def change
    drop_table :song_genres
  end
end

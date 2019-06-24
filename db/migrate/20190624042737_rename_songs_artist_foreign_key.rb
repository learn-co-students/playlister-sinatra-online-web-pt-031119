class RenameSongsArtistForeignKey < ActiveRecord::Migration[5.2]
  def change
    rename_column :songs, :artist, :artist_id
  end
end

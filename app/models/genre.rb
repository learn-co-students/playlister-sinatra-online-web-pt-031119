class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub('&', 'and').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.find {|genre| genre.slug == slug}
  end
end

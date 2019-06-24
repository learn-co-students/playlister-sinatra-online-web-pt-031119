class Artist < ActiveRecord::Base
  has_many :songs

  def slug
  end

  def self.find_by_slug
  end
end

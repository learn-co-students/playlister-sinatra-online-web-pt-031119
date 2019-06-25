class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs

	def slug
		slug_array = self.name.split(/\s*\W/).keep_if {|v| v=~/\w/} #forms array of individual words that only include word characters (letters, numbers, underscores)
		slug_name = slug_array.join("-").downcase #creates a string with '-' in between words
	end	

	def self.find_by_slug(slug)
		found_artist = nil
		Artist.all.collect do |artist| 
			if artist.slug == slug  #compares if the Artist object's slug name is equal to the provided slug name
				found_artist = artist
			end
		end
		found_artist  #returns the matching Artist object
	end
end
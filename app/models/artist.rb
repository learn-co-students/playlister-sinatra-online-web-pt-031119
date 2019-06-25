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
			# binding.pry
			if artist.slug == slug
				found_artist = artist
			end
		end
		# binding.pry
		found_artist
	end
end
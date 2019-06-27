class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
		slug_array = self.name.split(/\s*\W/).keep_if {|v| v=~/\w/} #forms array of individual words that only include word characters (letters, numbers, underscores)
		slug_name = slug_array.join("-").downcase #creates a string with '-' in between words
	end	

	def self.find_by_slug(slug)
		found_obj = nil
		self.all.collect do |obj| 
			if obj.slug == slug  #compares if the Artist object's slug name is equal to the provided slug name
				found_obj = obj
			end
		end
		found_obj  #returns the matching Artist object
	end
end
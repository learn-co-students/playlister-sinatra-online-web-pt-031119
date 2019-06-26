class SongsController < ApplicationController

	get '/songs' do 
		@songs = Song.all
		erb :'songs/index'
	end

	get '/songs/new' do
		@genres = Genre.all
		erb :'songs/new'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/show'
	end

	post '/songs' do
		@artist = Artist.create(name: params["Artist Name"])
		@genre = Genre.find_by_id(params[:genres])
		@song = Song.create(name: params["Name"], artist: @artist)
		@song.genre_ids = @genre.id
		redirect "/songs/#{@song.slug}"
	end

	
end


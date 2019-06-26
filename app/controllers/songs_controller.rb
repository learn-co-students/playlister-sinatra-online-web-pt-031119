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
		if Artist.find_by_name(params["Artist Name"])
			@artist = Artist.find_by_name(params["Artist Name"])
		else
			@artist = Artist.create(name: params["Artist Name"])
		end
		@genre = Genre.find_by_id(params[:genres])
		@song = Song.create(name: params["Name"], artist: @artist)
		@song.genre_ids = @genre.id
		redirect "/songs/#{@song.slug}"
	end

	get '/songs/:slug/edit' do
		@genres = Genre.all
		@artists = Artist.all
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end

	patch '/songs/:id' do
		if Artist.find_by_name(params["Artist Name"])
			@artist = Artist.find_by_name(params["Artist Name"])
		else
			@artist = Artist.create(name: params["Artist Name"])
		end
		@genre = Genre.find_by_id(params[:genres])
		@song = Song.find(params[:id])
		@song.update(artist: @artist)
		@song.update(genre_ids: @genre.id)
		redirect "/songs/#{@song.slug}"
	end

	
end


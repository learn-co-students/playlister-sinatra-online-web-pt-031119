require 'rack-flash'

class SongsController < ApplicationController

	use Rack::Flash

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

		@song = Song.create(name: params["Name"], artist: @artist)
		@song.genre_ids = params[:genres]
		flash[:message] = "Successfully created song."
		redirect "/songs/#{@song.slug}"
	end

	get '/songs/:slug/edit' do
		@genres = Genre.all
		@artists = Artist.all
		@song = Song.find_by_slug(params[:slug])
		erb :'songs/edit'
	end

	patch '/songs/:id' do
		@song = Song.find(params[:id])
		@song.genre_ids = params[:genres]
		if params["Artist Name"] != "" && Artist.find_by_name(params["Artist Name"]) != nil
			@artist = Artist.find_by_name(params["Artist Name"])
			@song.update(artist: @artist)
		elsif
			params["Artist Name"] != "" && Artist.find_by_name(params["Artist Name"]) == nil
			@artist = Artist.create(name: params["Artist Name"])
			@song.update(artist: @artist)
		end
		flash[:message] = "Successfully updated song."
		redirect "/songs/#{@song.slug}"
	end

	
end


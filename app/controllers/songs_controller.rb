require 'pry'
require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash

    # get '/' do 
    #     redirect to '/songs' 
    # end
    
    get '/songs' do 
        @songs = Song.all 
        erb :'/songs/index'
    end 

    get '/songs/new' do 
        # @song = Song.new(params[:song])
        @genres = Genre.all 
        erb :'/songs/new'
    end
    
    post '/songs' do
        # binding.pry  
        @song = Song.create(params[:song])
        # @song.genre_ids = params[:genres]
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.save 
        # binding.pry
        
        flash[:message] = "Successfully created song." 
        redirect to "/songs/#{@song.slug}" 
    end
    
    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end 

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end 

    patch '/songs/:slug' do
        # binding.pry   
        if !params[:song].keys.include?("genre_ids")  ## bug fix 
            params[:song]["genre_ids"] = []
        end
        
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        if !params[:artist][:name].empty? 
            @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        end 

        # @song.genre_ids = params[:song][:genre_ids]
        
        @song.save
        # binding.pry 

        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{@song.slug}"
    end 

    # delete '/songs/:slug' do 
    #     Song.destroy(params[:id])
    #     redirect to '/songs' 
    # end 


end 
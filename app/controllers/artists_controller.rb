class ArtistsController < ApplicationController

    # get '/' do 
    #     redirect to "/artists"
    # end 

    get '/artists' do 
        @artists = Artist.all 
        erb :'/artists/index' 
    end 

    get '/artists/new' do 
        # @artist = Artist.new 
        erb :'/artists/new' 
    end 

    post '/artists' do 
        @artist = Artist.create(params[:artist])
        redirect to "/artists/#{@artist.slug}"
    end 

    get '/artists/:slug' do 
        @artist = Artist.find_by_slug(params[:slug])
        erb :'/artists/show' 
    end 

    get '/artists/:slug/edit' do
        @artist = Artist.find(params[:id]) 
        erb :'/artists/edit' 
    end 

    patch 'artists/:slug' do 
        @artist = Artist.find(params[:id])

        redirect to "artists/#{@artist.slug}"
    end 

    delete '/artists/:slug' do
        Article.destroy(param[:id])
        redirect to "/artists"
    end 

     

end

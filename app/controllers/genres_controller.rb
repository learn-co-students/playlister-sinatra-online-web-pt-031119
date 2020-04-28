class GenresController < ApplicationController 

    # get '/' do 
    #     redirect to '/genres' 
    # end 

    get '/genres' do 
        @genres = Genre.all
        erb :'/genres/index' 
    end 

    get '/genres/new' do 
        @genre = Genre.new(params[:genre])
        erb :'/genres/new'
    end
    
    post '/genres' do 
        @genre = Genre.create(params[:genre])
        redirect to "/genres/#{@genre.slug}"
    end
    
    get '/genres/:slug' do 
        @genre = Genre.find_by_slug(params[:slug])
        erb :'/genres/show'
    end 

    get '/genres/:slug/edit' do 
        @genre = Genre.find(params[:id])
        erb :'/genres/edit'
    end
    
    patch '/genres/:slug' do 
        @genre = Genre.find(params[:id])

        redirect to "/genres/#{@genre.slug}"
    end
    
    delete '/genres/:slug' do 
        Genre.destroy(params[:id])
        redirect to '/genres'
    end 


end 
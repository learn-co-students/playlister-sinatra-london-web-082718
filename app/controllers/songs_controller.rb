class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post "/songs" do
    # binding.pry
    @song = Song.create(name: params["name"])
    @song.artist = Artist.find_or_create_by(name: params["artist"])
    @song.genre_ids = params["genres"]
    @song.save
    redirect "/songs/#{@song.slug}"
    # binding.pry
  end

  get "/songs/:slug/edit" do
    @song = Song.find(params[:slug])
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    song = Song.find(params[:slug])
    song.update(params[:song])
    redirect "/songs/#{@song.slug}"
  end

  delete "/songs/:slug" do
    song = Song.find(params[:slug])
    song.destroy
    redirect "/songs"
  end
end

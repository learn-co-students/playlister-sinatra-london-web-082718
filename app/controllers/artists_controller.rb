class ArtistsController < ApplicationController

  get "/artists" do
    @artists = Artist.all
    erb :"artists/index"
  end

  get "/artists/new" do
    erb :"artists/new"
  end

  get "/artists/:slug" do
    @artist = Artist.find_by_slug(params[:slug])
    erb :"artists/show"
  end

  post "/artists" do
    @artist = Artist.create(params[:artist])
    redirect "/artists/#{artist.slug}"
  end

  get "/artists/:slug/edit" do
    @artist = Artist.find(params[:slug])
    erb :"artists/edit"
  end

  patch "/artists/:id" do
    artist = Artist.find(params[:slug])
    artist.update(params[:artist])
    redirect "/artists/#{artist.slug}"
  end

  delete "/artists/:slug" do
    artist = Artist.find(params[:slug])
    artist.destroy
    redirect "/artists"
  end

end

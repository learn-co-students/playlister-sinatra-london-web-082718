class GenresController < ApplicationController

  get "/genres" do
    @genres = Genre.all
    erb :"genres/index"
  end
  get "/genres/new" do
    erb :"genres/new"
  end
  get "/genres/:slug" do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genres/show"
  end
  post "/genres" do
    @genre = Genre.create(name: params["Name"])
    redirect "/genres/#{genre.slug}"
  end
  get "/genres/:slug/edit" do
    @genre = Genre.find(params[:slug])
    erb :"genres/edit"
  end
  patch "/genres/:slug" do
    genre = Genre.find(params[:slug])
    genre.update(params[:genre])
    redirect "/genres/#{genre.slug}"
  end
  delete "/genres/:slug" do
    genre = Genre.find(params[:slug])
    genre.destroy
    redirect "/genres"
  end
end

class PlaylistsController < ApplicationController

  require 'json'

  def index
    @playlist = Playlist.all
    @user = User.find(current_user.id)
    @saved = @user.playlists
  end


  def create
    @new_playlist = Playlist.new(
    name: params[:name],
    description: params[:description],
    user_id: params[:user_id],
    )
    @new_playlist.save
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
  end

  def destroy
    Playlist.delete(params[:id])
      redirect_to url_for(:controller => :playlist, :action => :index)
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name, :description, :user_id)
  end


end

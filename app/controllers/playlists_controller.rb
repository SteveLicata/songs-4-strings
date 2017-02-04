class PlaylistsController < ApplicationController

  require 'json'

  def index
    @playlist = Playlist.all
    @user = User.find(current_user.id)
    @saved_playlists = @user.playlists
  end


  def create
    @new_playlist = Playlist.new(
    playlistname: params[:playlistname],
    description: params[:description],
    user_id: params[:user_id],
    )
    @new_playlist.save

    if (@new_playlist)
      redirect_to url_for(:controller => :playlists, :action => :index, :id => params[:id])
    else
      redirect_to url_for(:controller => :playlists, :action => :edit)
    end

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
    params.require(:playlist).permit(:playlistname, :description, :user_id)
  end


end

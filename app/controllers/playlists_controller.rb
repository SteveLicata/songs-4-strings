class PlaylistsController < ApplicationController

  require 'json'

  def index
    @playlists = Playlist.all
    @user = User.find(current_user.id)
    @new_playlists = @user.playlists
  end

  def new
    @playlist = Playlist.new(params[:playlist])
  end

  def create
    @new_playlist = Playlist.create(playlist_params)
    @new_playlist.save

    #params for checkbox when creating new playlist
    # params[:song][:song_ids].each do |song_id|
    #   @id = song_id.to_i
    #   @new_playlist.songs << Song.find(@id)
    # end

    if (@new_playlist)
      redirect_to url_for(:controller => :playlists, :action => :index, :id => params[:id])
    else
      redirect_to url_for(:controller => :playlists, :action => :edit)
    end

  end

  def show
    @playlist = Playlist.find(params[:id])
    @playlist_songs = @playlist
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
  end

  def destroy
    Playlist.delete(params[:id])
      redirect_to url_for(:controller => :playlists, :action => :index)
  end

  private
  def playlist_params
    params.require(:playlist).permit(:playlistname, :description, :user_id)
  end


end

class PlaylistsController < ApplicationController

  require 'json'

  def index
    @playlists = Playlist.all
    @user = User.find(current_user.id)
    @new_playlists = @user.playlists

  end

  def new
    @playlist = Playlist.new
  end

  def create
    @new_playlist = Playlist.create(playlist_params)
    @new_playlist.save

    if (@new_playlist)
      redirect_to url_for(:controller => :playlists, :action => :index, :id => params[:id])
    else
      redirect_to url_for(:controller => :playlists, :action => :edit)
    end

  end

  def show
    @playlist = Playlist.find(params[:id])
    @playlist_songs = @playlist.songs
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

  def remove_song_from_playlist
    # remove songs from setlists array
    @playlist = Playlist.find(params[:playlist_id])
    @playlist.songs.delete(Song.find(params[:song_id]))
  end

  private
  def playlist_params
    params.require(:playlist).permit(:playlistname, :description, :user_id)
  end


end

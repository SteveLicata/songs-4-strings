class SongsController < ApplicationController

  require 'json'

  def index
    @songs = Song.all
    @user = User.find(current_user)
    @saved = @user.songs
  end

  def song_form
    #display song for searching Guitar Party API
  end

  def song_guitar_party_api
    @message = "Songs"
    @song = params[:song_search]
    puts "current user", current_user.inspect

      if current_user != nil
        @user = User.find(current_user.id)
        @response = HTTParty.get("http://api.guitarparty.com/v2/songs/?query=#{@song}", headers: {"Guitarparty-Api-Key" => "#{ENV['GUITAR_PARTY_API_KEY']}"})

        puts "HERE IS RESPONSE:", @response.inspect
      end
  end

  def create
    @new_song = Song.new(
    song_search: params[:song_search],
    user_id: params[:user_id].to_i,
    title: params[:title],
    permalink: params[:permalink],
    body: params[:body],
    body_chords_html: params[:body_chords_html],
    body_stripped: params[:body_stripped],
    authors: params[:authors],
    chords: params[]
    )
    @new_song.save

    respond_to do |format|
      #if request is JS (AJAX)
      format .js

      #if request is normal Rails
      formal.html { redirect_to songs_path}
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
  end

  def destroy
    Song.delete(params[:id])
      redirect_to url_for(:controller => :songs, :action => :index)
  end

  def song_params
    params.require(:song).permit(:song_search, :user_id, :title, :permalink, :body, :body_chords_html, :body_stripped, :authors, :chords)
  end

end

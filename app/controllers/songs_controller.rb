class SongsController < ApplicationController

  require 'json'

  def index
    @songs = Song.all
    @user = User.find(current_user.id)
    @saved_songs = @user.songs
    puts "SAVED SONGS: ", @saved_songs
    # @playlist = Playlist.find(params[:id])
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
    puts "LET'S CREATE A NEW SONG STEVE!"
    puts "PARAMS:", params

    # Create new song:
    @new_song = Song.new(
      song_search: params[:song_search],
      user_id: params[:user_id].to_i,
      title: params[:title],
      permalink: params[:permalink],
      # body: params[:body],
      # body_chords_html: params[:body_chords_html],
      # body_stripped: params[:body_stripped],
      authors: params[:authors]
    )
    @new_song.save

    puts "THIS IS THE NEW SONG'S ID:", @new_song.id

    # Parameters: {
    #   "authors"=>"Shifty Shellshock",
    #   "chords_img_arr" => [
    #     "http://chords.guitarparty.com/chord-images/guitar_Am_xo221o.png",
    #     "http://chords.guitarparty.com/chord-images/guitar_C_x32o1o.png",
    #     "http://chords.guitarparty.com/chord-images/guitar_Dsus2_xxo23o.png",
    #     "http://chords.guitarparty.com/chord-images/guitar_D7_xxo212.png"
    #   ],
    #   "permalink"=>"http://www.guitarparty.com/song/butterfly/",
    #   "song_search"=>"crazy",
    #   "title"=>"Butterfly",
    #   "user_id"=>"1"
    # }

    # Create new chords associated to this song
    @chords_img_arr = params[:chords_img_arr]

    @chords_img_arr.each do |img|
      @new_chord = Chord.create(
        user_id: params[:user_id],
        image_url: img
      )

      # add the song_id to chord
      @new_chord.songs << @new_song

    end

    #new playlist
    @new_playlist = Playlist.new(
    name: params[:name],
    description: params[:description],
    user_id: params[:user_id]
    )
    @new_playlist.save

    respond_to do |format|
      if @new_song.save
        format.html { redirect_to song_search_path, notice: 'Your song_search_path is now available for questions, get started by clicking on options!' }
      else
        format.html { render :create }
      end
    end

    if (@new_song)
      redirect_to url_for(:controller => :songs, :action => :index, :id => params[:id])
    else
      redirect_to url_for(:controller => :songs, :action => :index)
    end

  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    puts "check here", params.inspect
    @song = Song.find(params[:id])
    @song.update({
      song_search: params[:song_search],
      user_id: params[:user_id].to_i,
      title: params[:title],
      permalink: params[:permalink],
      body: params[:body],
      body_chords_html: params[:body_chords_html],
      body_stripped: params[:body_stripped],
      authors: params[:authors]
      })
      if (@song)
        redirect_to url_for(:controller => :songs, :action => :show, :id => params[:id])
      else
        redirect_to url_for(:controller => :songs, :action => :edit)
      end
  end

  def destroy
    Song.delete(params[:id])
      redirect_to url_for(:controller => :songs, :action => :index)
  end

  private
  def song_params
    params.require(:song).permit(:song_search, :user_id, :title, :permalink, :body, :body_chords_html, :body_stripped, :authors, :chords)
  end

end

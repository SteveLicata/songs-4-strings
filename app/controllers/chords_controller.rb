class ChordsController < ApplicationController

  require 'json'

  def index
    @chords = Chord.all
    @user = User.find(current_user.id)
    @saved = @user.chords
  end

  def chord_form
    #display form for searchin Guitar Party API
  end

  def chord_guitar_party_api
    @message = "Chords"
    @chord = params[:chord_search]
    puts "current user", current_user.inspect

      if current_user != nil
        @user = User.find(current_user.id)
        @response = HTTParty.get("http://api.guitarparty.com/v2/chords/?query=#{@chord}", headers: {"Guitarparty-Api-Key" => "#{ENV['GUITAR_PARTY_API_KEY']}"})

        puts "HERE IS RESPONSE:", @response.inspect
      end
  end

  def create
    @new_chord = Chord.new(
    chord_search: params[:chord_search],
    user_id: params[:user_id],
    code: params[:code],
    image_url: params[:image_url],
    name: params[:name]
    )
    @new_chord.save

  end

  def edit
    @chord = Chord.find(params[:id])
  end

  def update
    puts "check here", params.inspect
    @chord = Chord.find(params[:id])
    @chord.update({
      chord_search: params[:chord_search],
      user_id: params[:user_id],
      code: params[:code],
      image_url: params[:image_url],
      name: params[:name]
      })
      if (@chord)
        redirect_to url_for(:controller => :chords, :action => :show, :id => params[:id])
      else
        redirect_to url_for(:controller => :chords, :action => :edit)
      end
  end

  def destroy
    Chord.delete(params[:id])
      redirect_to url_for(:controller => :chords, :action => :index)
  end

  private
  def chord_params
    params.require(:chord).permit(:chord_search, :user_id, :code, :image_url, :name)
  end

end

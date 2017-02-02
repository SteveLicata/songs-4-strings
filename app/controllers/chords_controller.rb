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

    respond_to do |format|
      # If request is JS (AJAX)
      format.js

      # If request is normal Rails way
      format.html { redirect_to recipes_path }
    end
  end

  def edit
    @chord = Chord.find(params[:id])
  end

  def update
  end

  def destroy
    Chord.delete(params[:id])
      redirect_to url_for(:controller => :chords, :action => :index)
  end

  private
  def chord_params
  end

end

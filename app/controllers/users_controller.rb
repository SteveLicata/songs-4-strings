class UsersController < ApplicationController

  #devise 
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @chord = Chord.all
    @song = Song.all
  end

end

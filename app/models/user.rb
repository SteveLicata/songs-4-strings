class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip
  has_attached_file :avatar,
    :styles => { :medium => "300x300px>", :thumb => "100x100px>" },
    :default_url => "/assets/songbook_default.png"

  validates_attachment_content_type :avatar,
    :content_type => /\Aimage\/.*\Z/

  # associations
  has_many :songs
  has_many :chords

  end

class Track < ActiveRecord::Base
  belongs_to :user
  
  has_many :votes
  has_many :reviews
  
  validates :title, presence: true
  validates :artist, presence: true
  validates :url, presence: true
  
end
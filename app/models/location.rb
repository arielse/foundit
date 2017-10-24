class Location < ApplicationRecord
  has_many :founds
  has_many :game_locations
  has_many :games, through: :game_locations
  mount_uploader :image, ImageUploader
end
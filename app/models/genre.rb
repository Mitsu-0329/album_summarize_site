class Genre < ApplicationRecord
  has_many :posts
  has_many :photo_albums


end

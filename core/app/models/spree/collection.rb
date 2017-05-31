module Spree
  class Collection < ApplicationRecord
    has_many :artwork_collections, dependent: :destroy, class_name: 'Spree::ArtworkCollection'
    has_many :artworks, through: :artwork_collections, class_name: 'Spree::Artwork'
    
    validates :name, presence: true
  end
end

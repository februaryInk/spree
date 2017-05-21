module Spree
  class Artwork < ApplicationRecord
    has_many :artwork_collections, class_name: 'Spree::ArtworkCollection'
    has_many :collections, through: :artwork_collections, class_name: 'Spree::Collection'
    
    has_one :image, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'
    
    validates :code, presence: true
    validates :complexity, presence: true
  end
end

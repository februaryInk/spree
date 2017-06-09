module Spree
  class Artwork < Spree::Base
    has_many :artwork_collections, dependent: :destroy, class_name: 'Spree::ArtworkCollection'
    has_many :collections, through: :artwork_collections, class_name: 'Spree::Collection'
    
    has_many :artwork_line_items, dependent: :destroy, class_name: 'Spree::ArtworkLineItem'
    has_many :line_items, through: :artwork_line_items, class_name: 'Spree::LineItem'
    
    has_one :image, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'
    
    accepts_nested_attributes_for :image
    
    validates :code, presence: true
    validates :complexity, presence: true
  end
end

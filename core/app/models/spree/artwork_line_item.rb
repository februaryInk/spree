module Spree
  class ArtworkLineItem < Spree::Base
    belongs_to :artwork, class_name: 'Spree::Artwork'
    belongs_to :line_item, class_name: 'Spree::LineItem'

    validates :artwork, :line_item, presence: true
    validates :artwork_id, uniqueness: { scope: :line_item_id }
  end
end

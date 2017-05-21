module Spree
  class ArtworkCollection < ApplicationRecord
    belongs_to :artwork, class_name: 'Spree::Artwork'
    belongs_to :collection, class_name: 'Spree::Collection'

    validates :artwork, :collection, presence: true
    validates :artwork_id, uniqueness: { scope: :collection_id }
  end
end

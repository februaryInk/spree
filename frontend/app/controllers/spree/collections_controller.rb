module Spree
  class CollectionsController < Spree::StoreController
    def index
      @artworks = Spree::Artwork.all.order(:code)
      @collections = Spree::Collection.joins(:artwork_collections).uniq.order(:name)
    end
  end
end

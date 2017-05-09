module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html
    
    def contact_us
    end
    
    def image_catalog
      @images = Dir.glob('app/assets/images/vector_art/*.jpg').sort_by { |image| image.split('/')[-1] }
    end

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
    
    def sizes_and_prices
    
    end
  end
end

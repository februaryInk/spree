module Spree
  class FontLineItem < Spree::Base
    belongs_to :font, class_name: 'Spree::Font'
    belongs_to :line_item, class_name: 'Spree::LineItem'

    validates :font, :line_item, presence: true
    validates :font_id, uniqueness: { scope: :line_item_id }
  end
end

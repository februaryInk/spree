module Spree
  class Font < ApplicationRecord
    validates :name, presence: true
    validates :presentation, presence: true

    has_many :font_line_items, dependent: :destroy, class_name: 'Spree::FontLineItem'
    has_many :line_items, through: :font_line_items, class_name: 'Spree::LineItem'
    has_many :images, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'

    has_one :image, -> { where( { position: 2 } ) }, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'
    has_one :preview_image, -> { where( { position: 1 } ) }, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'

    accepts_nested_attributes_for :image
    accepts_nested_attributes_for :preview_image
  end
end

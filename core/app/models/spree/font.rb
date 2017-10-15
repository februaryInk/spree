module Spree
  class Font < ApplicationRecord
    validates :name, presence: true
    validates :presentation, presence: true

    has_one :image, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'

    accepts_nested_attributes_for :image
  end
end

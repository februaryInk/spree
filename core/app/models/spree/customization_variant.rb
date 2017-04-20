module Spree
  class CustomizationVariant < Spree::Base
    belongs_to :customization, class_name: 'Spree::Customization'
    belongs_to :variant, class_name: 'Spree::Variant'

    validates :customization, :variant, presence: true
    validates :customization_id, uniqueness: { scope: :variant_id }
  end
end

module Spree
  class Customization < Spree::Base
    
    VALUE_TYPES = %w(select string text)
    
    has_many :customization_values, class_name: 'Spree::CustomizationValue'
    
    has_many :customization_variants, class_name: 'Spree::CustomizationVariant', dependent: :destroy
    has_many :variants, through: :customization_variants, class_name: 'Spree::Variant'
  end
end

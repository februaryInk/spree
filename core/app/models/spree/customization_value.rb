module Spree
  class CustomizationValue < Spree::Base
    belongs_to :customization, class_name: 'Spree::Customization'
  end
end

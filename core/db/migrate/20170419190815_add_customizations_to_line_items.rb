class AddCustomizationsToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_line_items, :customizations, :text
  end
end

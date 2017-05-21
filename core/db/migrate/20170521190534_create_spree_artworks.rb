class CreateSpreeArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_artworks do |t|
      
      t.integer :complexity
      
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end

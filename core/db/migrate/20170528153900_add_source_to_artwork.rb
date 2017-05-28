class AddSourceToArtwork < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_artworks, :source, :string
  end
end

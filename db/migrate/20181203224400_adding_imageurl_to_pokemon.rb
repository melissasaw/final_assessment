class AddingImageurlToPokemon< ActiveRecord::Migration[5.2]
  def self.up
  	add_column :pokemons, :image_url, :string
  end

  def self.down
    remove_column :pokemons, :image_url
  end
end
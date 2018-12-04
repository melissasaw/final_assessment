class AddingAnotherImageurlToPokemon< ActiveRecord::Migration[5.2]
  def self.up
  	add_column :pokemons, :image_url_1, :string
  end

  def self.down
    remove_column :pokemons, :image_url_1
  end
end
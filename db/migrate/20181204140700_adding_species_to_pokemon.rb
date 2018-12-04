class AddingSpeciesToPokemon< ActiveRecord::Migration[5.2]
  def self.up
  	add_column :pokemons, :species, :string
  end

  def self.down
    remove_column :pokemons, :species
  end
end
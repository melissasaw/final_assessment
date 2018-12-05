class AddingHappinessToPokemon< ActiveRecord::Migration[5.2]
  def self.up
  	add_column :pokemons, :happiness, :integer
  end

  def self.down
    remove_column :pokemons, :happiness
  end
end
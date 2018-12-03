class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
    	t.string :name
    	t.integer :national_id
    	t.float :height
    	t.float :weight
    	t.string :moves
    	t.integer :rarity
    	t.references :user

      t.timestamps
    end
  end
end

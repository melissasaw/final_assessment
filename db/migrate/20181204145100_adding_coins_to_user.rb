class AddingCoinsToUser< ActiveRecord::Migration[5.2]
  def self.up
  	add_column :users, :coins, :integer
  end

  def self.down
    remove_column :users, :coins
  end
end
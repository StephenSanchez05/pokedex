class ChangePokemonsColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :pokemons, :type, :element
  end
end 
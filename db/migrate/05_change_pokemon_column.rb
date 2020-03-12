class ChangePokemonColumn < ActiveRecord::Migration[5.1]
  
  def change
    rename_column :pokemon, :trainer_id, :user_id
  end
end 
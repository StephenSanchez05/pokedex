class CreatePokemonTable < ActiveRecord::Migration[5.1]
def change
  create_table :pokemon do |t|
    t.string :name
    t.string :type
    t.integer :trainer_id
  end
end
end
class AddUserIdToTrainers < ActiveRecord::Migration[5.1]
  def change
    add_column :trainers, :user_id, :integer
  end
end
class AddUserToWeights < ActiveRecord::Migration
  def change
    add_column :weights, :user_id, :int
  end
end

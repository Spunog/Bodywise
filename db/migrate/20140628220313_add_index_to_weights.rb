class AddIndexToWeights < ActiveRecord::Migration
  def change
  	add_index :weights, [:user_id, :dateWeighted], :unique => true
  end
end

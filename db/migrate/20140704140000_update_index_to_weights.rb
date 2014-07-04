class UpdateIndexToWeights < ActiveRecord::Migration
  def up
  	execute "DROP INDEX index_weights_on_date_weighted"
  	add_index :weights, [:user_id, :date_weighted], :unique => true
  end

  def down
  	add_index :weights, [:user_id, :date_weighted], :unique => true
  end
end

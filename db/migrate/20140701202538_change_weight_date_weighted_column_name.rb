class ChangeWeightDateWeightedColumnName < ActiveRecord::Migration
  def up
  	#newbie to PostgreSQL hopefully this should be the last badly named column!
	rename_column :weights, :dateWeighted, :date_weighted
  end
  def down
	rename_column :weights, :date_weighted, :dateWeighted
  end
end

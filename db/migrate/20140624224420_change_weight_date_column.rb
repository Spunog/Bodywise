class ChangeWeightDateColumn < ActiveRecord::Migration
  def up
	rename_column :weights, :date, :dateWeighted
  end
  def down
	rename_column :weights, :dateWeighted, :date
  end
end

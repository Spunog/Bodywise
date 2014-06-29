class ChangeDateFormatInWeights < ActiveRecord::Migration
  def change
  	change_column :weights, :dateWeighted, :datetime
  end
end

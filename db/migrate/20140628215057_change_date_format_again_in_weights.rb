class ChangeDateFormatAgainInWeights < ActiveRecord::Migration
  def change
  	change_column :weights, :dateWeighted, :date
  end
end

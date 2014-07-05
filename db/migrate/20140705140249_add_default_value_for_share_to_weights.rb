class AddDefaultValueForShareToWeights < ActiveRecord::Migration
  def up
  	change_column :weights, :share_category_id, :integer, :default => 1

  	#PSQL as will not apply default to existing rows
  	execute "UPDATE weights SET share_category_id = 1 WHERE share_category_id IS NULL;"
  end
end

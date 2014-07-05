class AddShareCategoryToWeight < ActiveRecord::Migration
  def change
  	add_column :weights, :share_category_id, :integer
    add_index :weights, :share_category_id
  end
end

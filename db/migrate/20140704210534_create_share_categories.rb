class CreateShareCategories < ActiveRecord::Migration
  def change
    create_table :share_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end

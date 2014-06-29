class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.decimal :weight_lbs
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.datetime :date
      t.decimal :weight_lbs

      t.timestamps
    end
  end
end

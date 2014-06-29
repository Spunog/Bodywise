class AddNoteToWeights < ActiveRecord::Migration
  def change
    add_column :weights, :note, :string
  end
end
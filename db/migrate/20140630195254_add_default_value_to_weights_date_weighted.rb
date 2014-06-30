class AddDefaultValueToWeightsDateWeighted < ActiveRecord::Migration
	def up
	  execute 'alter table weights alter column "dateWeighted" set default now()'
	end

	def down
	  change_column :weights, :dateWeighted, :date, :default => nil
	end
end

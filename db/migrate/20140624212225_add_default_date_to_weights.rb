class AddDefaultDateToWeights < ActiveRecord::Migration
	def up
	  Weight.where("date is NULL").update_all(date: Time.zone.now)
	end
end

json.array!(weights) do |weight|
	json.id weight.id
	json.weight_lbs weight.weight_lbs
	json.date weight.date_weighted
	json.description weight.date_weighted.to_date.to_formatted_s(:short)
	json.note weight.note || ''
end
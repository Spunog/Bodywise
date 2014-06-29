json.array!(weights) do |weight|
	json.id weight.id
	json.weight_lbs weight.weight_lbs
	json.date weight.dateWeighted
	json.description weight.dateWeighted.to_date.to_formatted_s(:short)
end
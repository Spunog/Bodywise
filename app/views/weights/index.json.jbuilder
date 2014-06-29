json.set! :graph do
  
	json.weights do
		json.partial! 'weights/graph_weights', weights: @weights
	end	

	json.goal @user.goals.last.weight_lbs

end

json.set! :page do
	json.set! :current, @weights.current_page
	json.set! :total, @weights.total_pages
	json.set! :per_page, @weights.per_page
end
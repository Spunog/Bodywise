json.set! :graph do
  
	json.weights do
		json.partial! 'weights/graph_weights', weights: @weights
	end

	json.goal 0

end
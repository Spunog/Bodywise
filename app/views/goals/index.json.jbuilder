json.array!(@goals) do |goal|
  json.extract! goal, :id, :weight_lbs, :user_id
  json.url goal_url(goal, format: :json)
end

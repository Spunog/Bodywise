class Goal < ActiveRecord::Base
	 belongs_to :user
	 validates :weight_lbs, :presence => true, numericality: { greater_than_or_equal_to: 0.1 }
end

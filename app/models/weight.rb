class Weight < ActiveRecord::Base
	belongs_to :user
	before_validation :set_dateWeighted
	validates :weight_lbs, :presence => true, numericality: { greater_than_or_equal_to: 0.1 }
	validates_uniqueness_of :dateWeighted, scope: :user_id, message:" already exists for this date"

	private

	def set_dateWeighted
	  self.dateWeighted ||=  Time.zone.today
	end

end
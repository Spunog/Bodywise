class Weight < ActiveRecord::Base
	belongs_to :user
	belongs_to :share_category
	after_initialize :set_date_weighted
	before_validation :set_date_weighted
	validates :weight_lbs, :presence => true, numericality: { greater_than_or_equal_to: 0.1 }
	validates_uniqueness_of :date_weighted, scope: :user_id, message:" already exists for this date"
	scope :public_only, -> { where(share_category_id: 3) }

	private

	def set_date_weighted
	  self.date_weighted ||=  Time.zone.today
	end

end
class User < ActiveRecord::Base
	has_many :weights, dependent: :destroy
	has_many :goals, dependent: :destroy
	after_commit :create_default_goal

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

  private
    # Use callbacks to share common setup or constraints between actions.
    def create_default_goal
      goal = self.goals.create(weight_lbs: 180)
      goal.save!
    end

end

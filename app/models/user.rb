class User < ActiveRecord::Base
	has_many :weights, dependent: :destroy
	has_many :goals, dependent: :destroy
	after_commit :create_default_goal
	validates :username,:uniqueness => {:case_sensitive => false}

	# Virtual attribute for authenticating by either username or email
  	# This is in addition to a real persisted field like 'username'
  	attr_accessor :login

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable,
	       :authentication_keys => [:login]

	def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    where(conditions).first
	  end
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def create_default_goal
      goal = self.goals.create(weight_lbs: 150)
      goal.save!
    end

end

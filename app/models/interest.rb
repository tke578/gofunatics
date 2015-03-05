class Interest < ActiveRecord::Base
	validates :name, :presence => true
	has_many :user_interests
	has_many :users, through: :user_interests
	has_many :events
end

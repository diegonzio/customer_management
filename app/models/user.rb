class User < ApplicationRecord
	has_many :events
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	def complete_name
		"#{name} #{lastname}"
	end
end

class Client < ApplicationRecord
	belongs_to :position, optional: true
	belongs_to :estate, optional: true
	has_many :events
	def complete_name
		"#{name} #{lastname}"
	end

end

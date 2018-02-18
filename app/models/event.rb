class Event < ApplicationRecord
	belongs_to :color, optional: true
	belongs_to :client, optional: true
	belongs_to :user, optional: true
	belongs_to :stage, optional: true
	attr_accessor :date_range
	def all_day_event?
		self.start == self.start.midnight && self.end == self.end.midnight ? true : false
	end
end
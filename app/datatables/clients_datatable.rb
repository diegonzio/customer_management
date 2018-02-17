class ClientsDatatable < ApplicationDatatable
private
	def data
		dimension.map do |dimension|
		[
			dimension.id,
			dimension.name,
			dimension.lastname,
		]
		end
	end
end
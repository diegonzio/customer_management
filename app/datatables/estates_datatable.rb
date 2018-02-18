class EstatesDatatable < ApplicationDatatable
private
	def data
		dimension.map do |dimension|
		[
			dimension.id,
			dimension.name,
			dimension.web,
		]
		end
	end
end
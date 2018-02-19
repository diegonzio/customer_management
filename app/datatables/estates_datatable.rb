class EstatesDatatable < ApplicationDatatable
private
	def data
		dimension.map do |dimension|
		[
			dimension.id,
			dimension.name,
			dimension.web,
			dimension.phone_1,
			dimension.commune.name,
			dimension.software.name,
			link_to("Editar", edit_estate_path(dimension.id), class:"btn btn-warning fileinput-button font-white")
		]
		end
	end
end
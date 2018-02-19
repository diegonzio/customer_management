class SoftwaresDatatable < ApplicationDatatable
private
	def data
		dimension.map do |dimension|
		[
			dimension.id,
			dimension.name,
			link_to("Editar", edit_software_path(dimension.id), class:"btn btn-warning fileinput-button font-white")
		]
		end
	end
end
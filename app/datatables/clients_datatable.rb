class ClientsDatatable < ApplicationDatatable
private
	def data
		dimension.map do |dimension|
		[
			dimension.id,
			dimension.name + ' ' + dimension.lastname,
			dimension.email,
			dimension.phone_1,
			dimension.position.name,
			get_responsable(dimension.responsable_id),
			dimension.estate.name,
			link_to("Editar", edit_client_path(dimension.id), class:"btn btn-warning fileinput-button font-white")
		]
		end
	end
	def get_responsable responsable_id
		responsable = User.find(responsable_id )
		return responsable.name + ' ' + responsable.lastname
	end
end
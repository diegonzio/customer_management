class SoftwaresController < ApplicationController
	before_action :authenticate_user!
	before_action :set_software, only:[:show, :update, :destroy, :edit]
	add_breadcrumb "Inicio", :root_path
	def index
		add_breadcrumb "Softwares", :softwares_path
		respond_to do |format|
			data = ['name']
			sort = %w[id name id]
			format.html
			format.json { render json: SoftwaresDatatable.new(view_context, Software.all, data, sort) }
		end
	end
	def new
		add_breadcrumb "Nuevo Software", :new_software_path
		@software = Software.new
	end
	def create
		@software = Software.new(software_params)
		if @software.save
			redirect_to softwares_path, success: "Software Agregado con éxito"
		else
			redirect_to softwares_path, error: "Hubo un error en el proceso!"
		end
	end
	def show
	end
	def edit
		add_breadcrumb "Editar Software", :edit_software_path
	end
	def update
		if @software.update(software_params)
			redirect_to softwares_path, success: "Software Editado con éxito"
		else
			redirect_to softwares_path, error: "Hubo un error en el proceso!"
		end
	end
	def destroy
		if @software.state == "active"
			@software.delete!
			redirect_to softwares_path, success: "Software Deshabilitado con éxito"
		else
			@software.active!
			redirect_to softwares_path, success: "Software Habilitado con éxito"
		end
	end
	private
		def set_software
			@software = Software.find(params[:id])
		end
		def software_params
			params.require(:software).permit(:name)
		end
end

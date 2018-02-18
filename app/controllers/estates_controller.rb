class EstatesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_estate, only:[:show, :update, :destroy, :edit]
	def index
		respond_to do |format|
			data = ['name']
			sort = %w[id name id]
			format.html
			format.json { render json: EstatesDatatable.new(view_context, Estate.all, data, sort) }
		end
	end
	def new
		@estate = Estate.new
	end
	def create
		@estate = Estate.new(estate_params)
		if @estate.save
			redirect_to estates_path, success: "Inmobiliaria Agregado con éxito"
		else
			redirect_to estates_path, error: "Hubo un error en el proceso!"
		end
	end
	def show
	end
	def edit
	end
	def update
		if @estate.update(estate_params)
			redirect_to estates_path, success: "Inmobiliaria Editado con éxito"
		else
			redirect_to estates_path, error: "Hubo un error en el proceso!"
		end
	end
	def destroy
		if @estate.state == "active"
			@estate.delete!
			redirect_to estates_path, success: "Inmobiliaria Deshabilitado con éxito"
		else
			@estate.active!
			redirect_to estates_path, success: "Inmobiliaria Habilitado con éxito"
		end
	end
	private
		def set_estate
			@estate = Estate.find(params[:id])
		end
		def estate_params
			params.require(:estate).permit(:name, :address, :web, :phone_1, :phone_2)
		end
end

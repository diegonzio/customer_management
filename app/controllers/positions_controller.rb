class PositionsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_position, only:[:show, :update, :destroy, :edit]
	def index
		respond_to do |format|
			data = ['name']
			sort = %w[id name id]
			format.html
			format.json { render json: PositionsDatatable.new(view_context, Position.all, data, sort) }
		end
	end
	def new
		@position = Position.new
	end
	def create
		@position = Position.new(position_params)
		if @position.save
			redirect_to positions_path, success: "Posición Agregado con éxito"
		else
			redirect_to positions_path, error: "Hubo un error en el proceso!"
		end
	end
	def show
	end
	def edit
	end
	def update
		if @position.update(position_params)
			redirect_to positions_path, success: "Posición Editado con éxito"
		else
			redirect_to positions_path, error: "Hubo un error en el proceso!"
		end
	end
	def destroy
		if @position.state == "active"
			@position.delete!
			redirect_to positions_path, success: "Posición Deshabilitado con éxito"
		else
			@position.active!
			redirect_to positions_path, success: "Posición Habilitado con éxito"
		end
	end
	private
		def set_position
			@position = Position.find(params[:id])
		end
		def position_params
			params.require(:position).permit(:name)
		end
end

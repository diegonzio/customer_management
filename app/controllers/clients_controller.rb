class ClientsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_client, only:[:show, :update, :destroy, :edit]
	add_breadcrumb "Inicio", :root_path
	def index
		add_breadcrumb "Clientes", :clients_path
		respond_to do |format|
			data = ['name']
			sort = %w[id name id]
			format.html
			format.json { render json: ClientsDatatable.new(view_context, Client.all, data, sort) }
		end
	end
	def new
		add_breadcrumb "Nuevo Cliente", :new_client_path
		@client = Client.new
	end
	def create
		@client = Client.new(client_params)
		if @client.save
			redirect_to clients_path, success: "Cliente Agregado con éxito"
		else
			redirect_to clients_path, error: "Hubo un error en el proceso!"
		end
	end
	def show
	end
	def edit
		add_breadcrumb "Editar Cliente", :edit_client_path
	end
	def update
		if @client.update(client_params)
			redirect_to clients_path, success: "Cliente Editado con éxito"
		else
			redirect_to clients_path, error: "Hubo un error en el proceso!"
		end
	end
	def destroy
		if @client.state == "active"
			@client.delete!
			redirect_to clients_path, success: "Cliente Deshabilitado con éxito"
		else
			@client.active!
			redirect_to clients_path, success: "Cliente Habilitado con éxito"
		end
	end
	private
		def set_client
			@client = Client.find(params[:id])
		end
		def client_params
			params.require(:client).permit(:name, :lastname, :phone_1, :phone_2, :email, :responsable_id, :position_id, :software_id, :estate_id)
		end
end

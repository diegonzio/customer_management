class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
		add_breadcrumb "Inicio", :root_path
	end
end

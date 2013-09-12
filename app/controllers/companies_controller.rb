class CompaniesController < ApplicationController
	def index
		@company = Company.all
	end

	def show
		@company = Company.find(params[:id])
		#@campaigns = @company.campaigns.all
	end

	def edit
	end

	def new
	end
end

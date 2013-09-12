class CompaniesController < ApplicationController
	def index
		@company = Company.all
	end

	def show
	end

	def edit
	end

	def new
	end
end

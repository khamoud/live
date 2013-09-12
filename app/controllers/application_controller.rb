class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
  	if current_company.user_level == 9
  		"/companies/1/campaigns/1"
  	else
    	company_campaigns_path(current_company)
    end
  end
  def allow_edit
  	unless current_company && current_company.user_level == 9
  		redirect_to root_url
  	end
  end
end

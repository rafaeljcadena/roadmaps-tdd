class HomeController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :contact]
  def index
  end

  def contact
  end

  def database_changes
  	params[:page] = 1 if params[:page].blank?
  	@versions = PaperTrail::Version.order(created_at: :desc).paginate(:per_page => 20, :page => params[:page])
  end
end

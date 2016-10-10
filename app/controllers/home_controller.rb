class HomeController < ApplicationController
  def index
  end

  def contact
  end

  def about
  end

  def database_changes
  	params[:page] = 1 if params[:page].blank?
  	@versions = PaperTrail::Version.order(created_at: :desc).paginate(:per_page => 20, :page => params[:page])
  end
end

class HomeController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :contact]
  def index
  end

  def contact
    Notification.create(user: User.first, text: "Teste de notificação com um texto longo e pá tá ligado mano", link_url: "/admin/users", image_url: "https://s3-sa-east-1.amazonaws.com/storage.ilookto.com/service_order_item_pictures/3d212a1af956dcfc57f8c69aa618427f36f8d40b.original.jpg?1499191292")
  end

  def database_changes
  	params[:page] = 1 if params[:page].blank?
  	@versions = PaperTrail::Version.order(created_at: :desc).paginate(:per_page => 20, :page => params[:page])
  end
end

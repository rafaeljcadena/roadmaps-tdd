# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  text       :string
#  image_url  :string
#  link_url   :string
#  viewed     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Notification < ApplicationRecord
  belongs_to :user
  include PgSearch
  has_paper_trail on: [:destroy, :update]
  after_create :send_notification
  
  def self.search(search, page)
    if search && search != ""
      paginate(:per_page => 20, :page => page).full_search(search)
    else
      paginate(:per_page => 20, :page => page)
    end
  end

  pg_search_scope :full_search,
    :against => [:user, :text, :image_url, :link_url, :viewed],
    :using => {
      :tsearch => {:prefix => true},
      :dmetaphone => {},
      :trigram => {}
    },
    :ignoring => :accents

  def send_notification
    # ActionCable.server.broadcast "user_#{self.user_id}_channel", 
    #   number: self.user.unviewed_notifications.count,
    #   notification: {
    #     id: id,
    #     text: text,
    #     link_url: link_url,
    #     image_url: image_url,
    #     created_at: created_at.strftime(Time::DATE_FORMATS[:default])
    #   }
  end
end

# Notification.create(user: User.first, text: "Texto", link_url: "/admin/users", image_url: "imagem.jpg")

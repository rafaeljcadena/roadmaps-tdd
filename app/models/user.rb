# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  locale                 :string
#  is_active              :boolean
#

class User < ActiveRecord::Base
  include PgSearch
  has_paper_trail :ignore => [:updated_at, :remember_created_at, :last_sign_in_at, :last_sign_in_ip, ]
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :name, presence: true, length: { in: 1..80 }
  # validates :locale, inclusion: { in: I18n.available_locales }
  has_many :notifications, dependent: :destroy

  def mark_notifications_viewed
    self.notifications.where(viewed: false).update_all viewed: true
  end

  def unviewed_notifications
    self.notifications.where(viewed: false)
  end

  def to_s
  	name
  end

  def active_for_authentication?
    super and self.is_active?
  end

  def self.search(search, page)
    if search && search != ""
      paginate(:per_page => 20, :page => page).full_search(search)
    else
      paginate(:per_page => 20, :page => page)
    end
  end

  pg_search_scope :full_search,
    :against => [:email, :name],
    :using => {
      :tsearch => {:prefix => true},
      :dmetaphone => {},
      :trigram => {}
    },
    :ignoring => :accents
end

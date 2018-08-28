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
  has_many :comments, as: :commenteable
  has_paper_trail :ignore => [:updated_at, :remember_created_at, :last_sign_in_at, :last_sign_in_ip, ]
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :name, presence: true, length: { in: 1..80 }
  # validates :locale, inclusion: { in: I18n.available_locales }

  def to_s
  	name
  end

  def active_for_authentication?
    super and self.is_active?
  end

end

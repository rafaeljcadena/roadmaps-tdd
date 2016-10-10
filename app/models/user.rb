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

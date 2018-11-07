# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  nome        :string
#  price       :float
#  status      :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :category
  include PgSearch
  has_paper_trail

  validates :nome, :price, presence: true

  def self.search(search, page)
    if search && search != ""
      paginate(:per_page => 20, :page => page).full_search(search)
    else
      paginate(:per_page => 20, :page => page)
    end
  end

  before_create do
    self.status = 'pendente'
  end

  validate :valid_price
  def valid_price
    errors.add(:price,'não pode ser menor que zero') if self.price && self.price < 0.0
  end

  pg_search_scope :full_search,
    :against => [:nome, :price, :status, :category],
    :using => {
      :tsearch => {:prefix => true},
      :dmetaphone => {},
      :trigram => {}
    },
    :ignoring => :accents
end

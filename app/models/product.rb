class Product < ApplicationRecord
  belongs_to :category
  include PgSearch
  # has_paper_trail

  validates :category, :name, :price, :status, presence: true
  validates :price, numericality: {greater_than: 0.0}

  validate do
    errors.add(:edit, 'Cannot be edited') if self.status == 'Approved'
  end


  def self.search(search, page)
    if search && search != ""
      paginate(:per_page => 20, :page => page).full_search(search)
    else
      paginate(:per_page => 20, :page => page)
    end
  end

  pg_search_scope :full_search,
    :against => [:name, :price, :status, :category],
    :using => {
      :tsearch => {:prefix => true},
      :dmetaphone => {},
      :trigram => {}
    },
    :ignoring => :accents
end

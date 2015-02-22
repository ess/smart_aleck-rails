class Category < ActiveRecord::Base
  has_many :categorizations,
    dependent: :destroy

  has_many :entries,
    through: :categorizations

  scope :with_entries, -> {
    joins(:categorizations).uniq
  }

  scope :excluding, ->(excluded) {
    where.not(id: excluded.map(&:id))
  }
end

class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :categorizations,
    dependent: :destroy

  has_many :entries,
    through: :categorizations

  default_scope {order(name: :asc)}

  scope :with_entries, -> {
    joins(:categorizations).uniq
  }

  scope :without_entries, -> {
    where.not(id: with_entries.map(&:id))
  }

  scope :excluding, ->(excluded) {
    where.not(id: excluded.map(&:id))
  }
end

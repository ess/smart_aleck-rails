class Entry < ActiveRecord::Base
  belongs_to :user

  has_many :categorizations,
    dependent: :destroy

  has_many :categories,
    through: :categorizations
end

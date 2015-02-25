class Categorization < ActiveRecord::Base
  belongs_to :entry
  belongs_to :category
end

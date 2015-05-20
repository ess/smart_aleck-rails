require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe '#add_category' do
    it 'associates the category with the entry' do
      category = Category.create(name: 'category 1')
      entry = described_class.create(title: 'entry 1', content: 'entry 1 content')
      expect(entry.categories).not_to include(category)
      expect(category.entries).not_to include(entry)
      
      entry.add_category(category)
      entry.reload
      category.reload

      expect(entry.categories).to include(category)
      expect(category.entries).to include(entry)
    end
  end
end

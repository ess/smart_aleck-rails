require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '.excluding' do
    let(:cat1) {described_class.create(name: 'cat 1')}
    let(:cat2) {described_class.create(name: 'cat 2')}
    let(:excluding) {described_class.excluding([cat1])}

    it 'includes categories not in the excluded list' do
      expect(excluding).to include(cat2)
    end

    it 'excludes categories in the excluded list' do
      expect(excluding).not_to include(cat1)
    end
  end
end

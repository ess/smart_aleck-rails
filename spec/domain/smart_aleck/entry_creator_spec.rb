require 'rails_helper'

RSpec.describe SmartAleck::EntryCreator do
  let(:user) {
    User.create(
      email: Faker::Internet.email,
      password: 'supersekrat',
      password_confirmation: 'supersekrat')
  }
  let(:cat1) {Category.create(name: 'cat 1')}
  let(:title) {Faker::Lorem.sentence}
  let(:content) {Faker::Lorem.paragraph}
  let(:categories) {[cat1]}
  let(:good_options) {
    {title: title, content: content, categories: categories, user: user}
  }
  let(:creator) {described_class.new(good_options)}

  describe '.new' do
    it 'requires a title' do
      good_options.delete(:title)
      expect {described_class.new(good_options)}.to raise_error(ArgumentError)
    end

    it 'requires content' do
      good_options.delete(:content)
      expect {described_class.new(good_options)}.to raise_error(ArgumentError)
    end

    it 'requires a user' do
      good_options.delete(:user)
      expect {described_class.new(good_options)}.to raise_error(ArgumentError)
    end

    it 'requires a list of categories' do
      good_options.delete(:categories)
      expect {described_class.new(good_options)}.to raise_error(ArgumentError)
    end
    
    it 'populates the entry reader' do
      expect(creator.entry).not_to be_nil
    end

    it 'uses the CategoryIndexer to index the entry categories' do
      expect(SmartAleck::CategoryIndexer).to receive(:index).with(categories).and_call_original
      described_class.new(good_options)
    end
  end

  describe '#entry' do
    it 'is an Entry' do
      expect(creator.entry).to be_a(Entry)
    end

    it 'has a category hash' do
      expect(creator.entry.category_hash).
        to eql(SmartAleck::CategoryIndexer.index(categories))
    end

    it 'belongs to the proper user' do
      expect(creator.entry.user).to eql(user)
    end
  end
end

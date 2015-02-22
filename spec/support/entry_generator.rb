require 'faker'

class EntryGenerator
  def self.generate(options = {})
    SmartAleck::EntryCreator.create(
      title: options[:title] || Faker::Lorem.sentence,
      content: options[:content] || Faker::Lorem.paragraph,
      categories: options[:categorized]
    )
  end
end

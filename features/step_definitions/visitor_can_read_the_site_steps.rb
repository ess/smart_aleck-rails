Given %(I'm a Visitor) do
  true
end

def category_named(name)
  Category.find_by_name(name)
end

def categories_named(names)
  names.map {|name| category_named(name)}
end

def system_user
  User.first || User.create(email: 'system@example.com', password: 'sekrat', password_confirmation: 'sekrat')
end

Given %(the following Categories exist:) do |categories|
  categories.hashes.each do |category_hash|
    Category.create(name: category_hash['Name'])
  end
end

Given %(the following Entries exist:) do |entries|
  entries.hashes.each do |entry_hash|
    SmartAleck::EntryCreator.create(
      title: entry_hash['Title'],
      content: Faker::Lorem.paragraphs.join("\n\n"),
      categories: categories_named(entry_hash['Categories'].split(', ')),
      user: system_user
    )
  end
end

When %(I visit the main site) do
  visit '/'
end

def category_selector(category)
  "a#category-#{category.id}"
end

Then %r(^I see (.+) in the list of Categories$) do |category_name|
  within('#tags') do
    expect(page).
      to have_selector(category_selector(category_named(category_name)))
  end
end

Then %r(^I don't see (.+) in the list of Categories$) do |category_name|
  within('#tags') do
    expect(page).
      to have_no_selector(category_selector(category_named(category_name)))
  end
end

Given %(I'm on the main site) do
  step %{I visit the main site}
end

When %r(^I click on the (.+) Category$) do |category_name|
  within('#tags') do
    click_link(category_name)
  end
end

Then %r(^(.+) is removed from the possible Categories$) do |category_name|
  step %{I don't see #{category_name} in the list of Categories}
end

def entry_selector(entry)
  "#entry-#{entry.id}"
end

def entry_named(title)
  Entry.find_by_title(title)
end

Then %r(^I see the (.+) Entry$) do |entry_title|
  expect(page).to have_selector(entry_selector(entry_named(entry_title)))
end

Then %r{^I don't see the (.+) Entry$} do |entry_title|
  expect(page).to have_no_selector(entry_selector(entry_named(entry_title)))
end

When %r{^I add the (.+) Category to my current view$} do |category_name|
  step %{I click on the #{category_name} Category}
end

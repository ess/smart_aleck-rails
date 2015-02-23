Given %(there are existing Categories) do
  10.times do
    Category.create(name: Faker::Lorem.word)
  end
end

When %(I browse to a Category context) do
  category_id = memorize_fact(:category_id, Category.all.sample.id)
  save_and_open_page
  within('#tags') do
    as_me do
      find("#category-#{category_id}").click()
    end
  end
end

Then %(I see an option to add an Entry to the context) do
  within('main') do
    expect(page).to have_selector('form#new-entry')
  end
end

When %(I submit a new Entry) do
  new_title = memorize_fact(:entry_title, Faker::Lorem.sentence)
  new_content = memorize_fact(:entry_content, Faker::Lorem.paragraph)

  within('form#new-entry') do
    as_me do
      fill_in('entry_title', with: new_title)
      fill_in('entry_content', with: new_content)
      find('#create-entry').click()
    end
  end
end

Then %(I land back on the Category context) do
  expect(URI.parse(current_url).path).to eql("/tags/#{Category.find(recall_fact(:category_id)).name}")
end

Then %(the new entry is displayed) do
  within('main') do
    expect(page).to have_content(recall_fact(:entry_title))
    expect(page).to have_content(recall_fact(:entry_content))
  end
end

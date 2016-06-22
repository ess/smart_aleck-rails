def default_password
  'supersekrat'
end

def me
  User.find(recall_fact(:my_user_id))
end

def as_me(&block)
  login_as(me, scope: :user)
  block.call(me)
  logout(:user)
end

Given %(I'm a User) do
  user = User.create(
    email: Faker::Internet.email,
    password: default_password,
    password_confirmation: default_password
  )


  memorize_fact(:my_user_id, user.id)
end

Given %(I'm on the homepage) do
  as_me do
    visit(root_path)
  end
end

When %(I click on Manage Categories) do
  as_me do
    within('.header') do
      within('nav') do
        find('#manage-categories').click()
      end
    end
  end
end

Then %(I land on the Category Manager) do
  expect(URI.parse(current_url).path).to eql(categories_path)
end

Then %(I see a form to add a new Category) do
  expect(page).to have_selector('form#new-category')
end

Given %(I'm on the Category Manager) do
  step %{I'm a User}
  step %{I'm on the homepage}
  step %{I click on Manage Categories}
end

When %(I submit a new Category name) do
  category_name = memorize_fact(:category_name, Faker::Lorem.word)
  as_me do
    fill_in('category_name', with: category_name)
    find('#create-category').click()
  end
end

Then %(the Category is created) do
  expect(Category.find_by_name(recall_fact(:category_name))).not_to be_nil
end

Then %(it appears in the Category List) do
  within('#tags') do
    expect(page).to have_content(recall_fact(:category_name))
  end
end

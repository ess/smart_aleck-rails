# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

prompt = '> '

print "First user email #{prompt}"
email = $stdin.gets.chomp

print "First user password #{prompt}"
password = $stdin.gets.chomp

User.create(email: email, password: password, password_confirmation: password)

instructions =<<INSTRUCTIONS
SmartAleck is a knowledge base system that always gives you exactly what you ask for. That is, you browse the articles in the system by combining the categories in the bar on the left side of the page.

If an article is categorized with "Category A," then that article will show up only if "Category A" is the only category in your current view. Likewise, an article categorized with both "Category A" and "Category B" will only show up if you have selected those exact categories.

To make things a bit easier, the list of categories that you can choose shrinks as you add categories to your view. Categories that you've already chosen are removed from the list, and the list only shows categories that will yield articles at any point in time.
INSTRUCTIONS

Entry.create(
  title: 'Welcome to SmartAleck',
  content: instructions
)

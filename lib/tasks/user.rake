require 'securerandom'

namespace :user do
  desc 'Create a new user'
  task :create, [:email] => [:environment] do |t, args|
    email = args[:email]
    password = SecureRandom.hex(12)

    u = User.new(email: email, password: password)

    if u.save
      puts "Username: #{email}"
      puts "Password: #{password}"
    else
      puts "Could not create user #{email}: #{u.errors.full_messages}"
    end
  end
end

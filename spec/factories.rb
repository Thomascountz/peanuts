# Users
FactoryGirl.define do

  factory :event do
    title "This Is My Event"
    description "My even is so much fun, you all will enjoy it a lot, I promise!"
    location "Lyceum Theatre"
    manager
  end

  factory :user, aliases: [:manager] do
    first_name "John"
    last_name  "Doe"
    email { "#{first_name}#{last_name}@example.com" }
    password "password"
    password_confirmation "password"
  end
end

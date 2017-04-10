# Users
FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyText"
    location "MyText"
    manager_id 1
  end
  factory :user do
    first_name "John"
    last_name  "Doe"
    email { "#{first_name}#{last_name}@example.com" }
    password "password"
    password_confirmation "password"
  end
end
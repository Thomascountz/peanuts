# Users
FactoryGirl.define do

  factory :user, aliases: [:manager] do
    first_name "John"
    last_name  "Doe"
    email { "#{first_name}#{last_name}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :event do
    title "This is My Event"
    description "My event is so much fun, you will all enjoy it alot! My Promise"
    location "149 W 45th St, New York, NY 10036, USA"
    manager
  end

  factory :event_time do
    start_time { Time.zone.now + 1.hours }
    end_time { Time.zone.now + 4.hours }
    event
  end

end

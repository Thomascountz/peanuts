# Users
FactoryGirl.define do

  factory :user do
    first_name "John"
    last_name  "Doe"
    email { "#{first_name}#{last_name}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :manager, class: User do
    first_name "Maggie"
    last_name "Manager"
    email { "#{first_name}#{last_name}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :attendee, class: User do
    first_name "Andy"
    last_name "Attendee"
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
    start_time { (Time.zone.now + 1.hours).beginning_of_hour }
    end_time { (Time.zone.now + 4.hours).beginning_of_hour }
    event
  end

  factory :ticket do
    attendee
    event_time
  end

end

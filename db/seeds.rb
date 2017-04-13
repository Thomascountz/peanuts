# Demo user
user = User.find_or_initialize_by(email: "demodan@example.com")
user.first_name = "Dan"
user.last_name= "Demo"
user.email= "demodan@example.com"
user.password= "password"
user.password_confirmation= "password"
user.save!

event_1 = user.managed_events.find_or_initialize_by(title: "Dan's Secret Garden")
event1.description = "This is your change to see me in action. You will never get to experience anything like this again, so do yourself a favor and book now."
event1.location= "Dixon Place Theater"
event_1.save!

event_2 = user.managed_events.find_or_initialize_by(title: "Dan's Secret Garden II")
event_2.description= "Oh man, I'm back! In case you missed it last time, here I am again in full glory! Come and witness a show like you've never witnessed before"
event_2.location = "Byham Theatre Pittsburgh"
event_2.save!

event_3 = user.managed_events.find_or_initialize_by(title: "Piggly Wiggly")
event_3.description = "Oink Oink? More like Shaboink Shaboink! That's right, Piggly Wiggly will have you bouncing in your seats! Come see my premiere DJ set this weekend!"
event_3.location = "Signature Theater"
event_3.save!

event_1.event_times.find_or_initialize_by(start_time: Time.zone.now + 2.hours, end_time: Time.zone.now + 5.hours).save!
event_1.event_times.find_or_initialize_by(start_time: Time.zone.now + 6.hours, end_time: Time.zone.now + 9.hours).save!
event_1.event_times.find_or_initialize_by(start_time: Time.zone.now + 10.hours, end_time: Time.zone.now + 13.hours).save!

event_2.event_times.find_or_initialize_by(start_time: Time.zone.now + 1.hours, end_time: Time.zone.now + 6.hours).save!
event_2.event_times.find_or_initialize_by(start_time: Time.zone.now + 6.days, end_time: Time.zone.now + 6.days + 2.hours).save!
event_2.event_times.find_or_initialize_by(start_time: Time.zone.now + 19.days + 2.hours, end_time: Time.zone.now + 19.days + 5.hours).save!

event_3.event_times.find_or_initialize_by(start_time: Time.zone.now + 8.days + 1.hour, end_time: Time.zone.now + 8.days + 4.hours).save!
event_3.event_times.find_or_initialize_by(start_time: Time.zone.now + 27.days + 8.hours, end_time: Time.zone.now + 27.days + 10.hours).save!
event_3.event_times.find_or_initialize_by(start_time: Time.zone.now + 200.days + 2.hours, end_time: Time.zone.now + 200.days + 5.hours).save!

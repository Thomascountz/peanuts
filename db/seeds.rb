# Demo Dan
dan = User.find_or_initialize_by(email: "demodan@example.com")
dan.destroy
dan = User.new
dan.first_name = "Dan"
dan.last_name= "Demo"
dan.email = "demodan@example.com"
dan.password= "password"
dan.password_confirmation= "password"
dan.save!

event_1 = dan.managed_events.build
event_1.title = "Dan's Secret Garden"
event_1.description = "This is your change to see me in action. You will never get to experience anything like this again, so do yourself a favor and book now."
event_1.location = "Dixon Place Theater"
event_1.save!

event_2 = dan.managed_events.build
event_2.title = "Dan's Secret Garden II"
event_2.description= "Oh man, I'm back! In case you missed it last time, here I am again in full glory! Come and witness a show like you've never witnessed before"
event_2.location = "Byham Theatre Pittsburgh"
event_2.save!

event_3 = dan.managed_events.build
event_3.title = "Piggly Wiggly"
event_3.description = "Oink Oink? More like Shaboink Shaboink! That's right, Piggly Wiggly will have you bouncing in your seats! Come see my premiere DJ set this weekend!"
event_3.location = "Signature Theater"
event_3.save!

event_1.event_times.create(start_time: Time.zone.now + 2.hours, end_time: Time.zone.now + 5.hours)
event_1.event_times.create(start_time: Time.zone.now + 6.hours, end_time: Time.zone.now + 9.hours)
event_1.event_times.create(start_time: Time.zone.now + 10.hours, end_time: Time.zone.now + 13.hours)

event_2.event_times.create(start_time: Time.zone.now + 1.hours, end_time: Time.zone.now + 6.hours)
event_2.event_times.create(start_time: Time.zone.now + 6.days, end_time: Time.zone.now + 6.days + 2.hours)
event_2.event_times.create(start_time: Time.zone.now + 19.days + 2.hours, end_time: Time.zone.now + 19.days + 5.hours)

event_3.event_times.create(start_time: Time.zone.now + 8.days + 1.hour, end_time: Time.zone.now + 8.days + 4.hours)
event_3.event_times.create(start_time: Time.zone.now + 27.days + 8.hours, end_time: Time.zone.now + 27.days + 10.hours)
event_3.event_times.create(start_time: Time.zone.now + 200.days + 2.hours, end_time: Time.zone.now + 200.days + 5.hours)

# Demo Dottie
dottie = User.find_or_initialize_by(email: "demodottie@example.com")
dottie.destroy
dottie = User.new
dottie.first_name = "Dottie"
dottie.last_name= "Demo"
dottie.email= "demodottie@example.com"
dottie.password= "password"
dottie.password_confirmation= "password"
dottie.save!

event_4 = dottie.managed_events.build
event_4.title = "The Great Dottie"
event_4.description = "Dottie can act. Dottie can sing! Dottie can raise two twin boys, get an MFA in Sculpture, and manage a fortune 500? Come find out in my new one woman show, The Great Dottie."
event_4.location = "Ars Nova, New York"
event_4.save!

event_4.event_times.create(start_time: Time.zone.now + 22.hours, end_time: Time.zone.now + 25.hours)
event_4.event_times.create(start_time: Time.zone.now + 26.hours, end_time: Time.zone.now + 29.hours)
event_4.event_times.create(start_time: Time.zone.now + 30.hours, end_time: Time.zone.now + 33.hours)
event_4.event_times.create(start_time: Time.zone.now + 34.hours, end_time: Time.zone.now + 37.hours)
event_4.event_times.create(start_time: Time.zone.now + 38.hours, end_time: Time.zone.now + 41.hours)
event_4.event_times.create(start_time: Time.zone.now + 42.hours, end_time: Time.zone.now + 45.hours)

ticket_1 = dottie.tickets.create(event_time: event_1.event_times.second)
ticket_2 = dottie.tickets.create(event_time: event_1.event_times.second)
ticket_3 = dan.tickets.create(event_time: event_4.event_times.first)
ticket_4 = dan.tickets.create(event_time: event_4.event_times.fourth)

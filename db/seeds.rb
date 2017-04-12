# Demo user
user = User.create( first_name:                 "Dan",
                    last_name:                 "Demo",
                    email:      "demodan@example.com",
                    password:              "password",
                    password_confirmation: "password" )

user.managed_events.create( title:       "Dan's Secret Garden",
                            description: "This is your change to see me in action. You will never get to experience anything like this again, so do yourself a favor and book now.",
                            location:    "Dixon Place Theater" )

user.managed_events.create( title:       "Dan's Secret Garden II",
                            description: "Oh man, I'm back! In case you missed it last time, here I am again in full glory! Come and witness a show like you've never witnessed before",
                            location:    "Byham Theatre Pittsburgh" )

user.managed_events.create( title:       "Piggly Wiggly",
                            description: "Oink Oink? More like Shaboink Shaboink! That's right, Piggly Wiggly will have you bouncing in your seats! Come see my premiere DJ set this weekend!",
                            location:    "Signature Theater" )

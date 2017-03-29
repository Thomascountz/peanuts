[![Build Status](https://semaphoreci.com/api/v1/thomascountz1/peanuts/branches/master/shields_badge.svg)](https://semaphoreci.com/thomascountz1/peanuts)
[![Code Climate](https://codeclimate.com/github/Thomascountz/peanuts/badges/gpa.svg)](https://codeclimate.com/github/Thomascountz/peanuts)

# Peanuts. A minimal event tickets sales app.

## Project Overview
Peanuts empowers event managers with the ease of ticket sales and attendee lists. Attendees can easily purchase tickets and have eTickets delivered to their email. The MVP of this platform will only "sell" tickets with a price of $0.

#### Challenge 
Event managers need a way to manage their ticket sales both online and on location. Likewise, attendees need a way to easily purchase tickets.

#### Goals
- To allow event managers to list their event and available tickets
- To allow event managers to maintain a list of attendees and ticket sales 
- To allow attendees to purchse a ticket to a particular event
- To allow attendees to maintain a record of their ticket purchases

## System Overview

- Purpose
  - To allow users to sell and buy tickets online and in person
- User roles
  - An event holder can
    - List an event description, dates and times, and available tickets
    - Assign a ticket to an attendee via purchase
    - Maintain a list of attendees and remaining ticket available
  - An attendee can
    - See a list of events and event times
    - Select and purchase a ticket to an event 
    - Receive an email with an eTicket (proof of purchase)

## System Architecture

- Ruby on Rails 5
- Postgres (in production)
- Heroku (deployment)
- Github 
- Notable Gems
  - devise (user authorization and authentication)
  - bootstrap-sass (styling and javascript)
  - rspec-rails (controller and unit testing)

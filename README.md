[![Stories in Ready](https://badge.waffle.io/Thomascountz/peanuts.png?label=ready&title=Ready)](https://waffle.io/Thomascountz/peanuts)
[![Code Climate](https://codeclimate.com/github/Thomascountz/peanuts/badges/gpa.svg)](https://codeclimate.com/github/Thomascountz/peanuts)
# Peanuts. A minimal event ticket sales app.

## Project Overview
Peanuts empowers event managers with the ease of ticket sales and attendee lists. Attendees can easily purchase tickets and have eTickets delievered to their email. 

#### Challenge 
event managers need a way to manage their ticket sales both online and on location. Likewise, attendees need a way to easily purchase tickets.

#### Goals
- To allow event managers to list their event and availble tickets
- To allow event managers to maintain a list of attendees 
- To allow attendees to select a ticket to a particular event
- To allow attendees to maintain a record of their ticket selection

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
    - Recieve an email with an eTicket (proof of purchase)

## System Architecture

- Ruby on Rails 5
- Postgres (in production)
- Heroku (deployment)
- Github 
- Notable Gems
  - devise (user authorization and authentication)
  - bootstrap-sass (styling and javascript)
  - rspec-rails (controller and unit testing)
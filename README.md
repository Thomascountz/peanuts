[![Stories in Ready](https://badge.waffle.io/Thomascountz/peanuts.png?label=ready&title=Ready)](https://waffle.io/Thomascountz/peanuts)
# Peanuts. A minimal weekly employee schedule app.

## Project Overview
Peanuts empowers employees and relives managers by allowing users to set and update a weekly reoccurring work schedule. Once a manager sets up a weekly schedule, employees can easily **give** and **take** shifts on a temporary or permanent basis. 

#### Challenge 
Employees can be daunted by lack of oversight and communication from management when it comes to temporary schedule changes. Management can either feel the need to micromanage or disregard daily scheduling changes and can run into issues with ensuring all shifts are covered. The platform will attempt to mitigate these issues by allowing employees autonomy and accountability in regards to their schedule. 

#### Goals
- To allow employees and managers to quickly see an overview of the weekly schedule
- To allow employees to trade/give up/take shifts with one another and without a manager
- To allow a manager to maintain oversight of employees' schedules without being overwhelmed

## System Overview

- Purpose
  - To allow users to manage a weekly employee schedule
- User roles
  - An employee can
    - See the schedule for the week ahead
    - Give up shifts they are assigned to
    - Take up shifts that others have given up
  - A manager can
    - See the schedule for the week ahead
    - Adjust the shift times for each day
    - Add new shifts for each day
    - Assign an employee to a shift, temporarily or permanently 

## System Architecture

- Ruby on Rails 5
- Postgres (in production)
- Heroku (deployment)
- Github 
- Notable Gems
  - devise (user authorization and authentication)
  - bootstrap-sass (styling and javascript)
  - rspec-rails (controller and unit testing)
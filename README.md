# Robin

## Description
Robin is a gift-giving platform. Inspired by the crowdfunding payment model, Robin allows a user to create a private 'Gift' group, which represents a funding campaign on a set timeline. Using Stripe, users can easily manage funding by making payments to the user who created the campaign. Each user in Robin also has a dashboard, which allows for the tracking and management of groups and payments relevant to that user. Email alerts are sent for various application conditions: user creation, gift creation, campaign completetion, etc.

## Technologies Used
- Ruby on Rails
  - CRUD
  - 1:N
  - Rendering, Layouts, Partials
  - Cron Job
  - mailer
  - SASS
  - coffeescript
  - jQuery
  - (AJAX)
  - ActionMailer
- Stripe API
  - Omniauth
  - devise
  - checkout
- Git flow
  - Github
- CSS
  - ZURB Foundation

## Wireframes
    
    (see Trello board)

## ERD

    (see Trello board)

## APIs Used
- Stripe
- Gravatar

## Scope
- A user can create an account/login
- A user can great a 'gift' group
- A user can connect to Stripe to recieve payments for a gift
- Other users can join the campaign to fund the gift
- Users who joined can make 'contributions' of various amounts toward the funding goal
- Upon completion of the gift campaign, users can finalize payments with Stripe
- Each User has a 'dashboard' that provides tracking information of campaigns created, joined, funded, and which ones are completed and ready for final payment


## Wishlist
- Users can communicate privately within a gift group (comments)
- Dashboard serves alerts about groups relevant to the user
- Extended email alert capabilites, and subscription options


## Contributors

* Jeremy Brenner
* Neil Spurgeon
* Daniel Gih

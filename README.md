# Running CK-CMS Locally

## Ruby Version
2.3.1

## Rails Version
4.2.6

## System dependencies
* Postgresql
* Passenger

## Database creation

* Update database.yml.example with your credentials
* Run `rake db:create db:migrate db:seed`

## Booting up the app for the first time
* `bundle install`
* `rails s`, go to browser and open site to init Camaleon
* Login to Camaleon with u: admin pass: admin, site: Commerce Kitchen
* `rake data:users`
* `rake data:blog`

From then on, to wipe out and start over
* `rake db:reset`
* Same steps as above from `rails s`

## Site themes
* Create a new site theme template with: `rails g camaleon_cms:theme theme_name`
* Delete a site theme with `rails d camaleon_cms:theme theme_name` * Make sure server is stopped first.

## Testing

Rspec is used on this project, which can be run with: `rspec`

## Deployment instructions

Deployment is done via Capistrano

`cap staging deploy`
`cap production deploy`

# Developer Norms/Standards

The purpose of this section is to layout the norms of this project.  Future development should follow the standard set forth in this guide.

## Ruby

Rubocop is used on this project, which defines the Ruby styling agreed upon for this project.  The rules are bendable, but a best effort should be made to stay within the rubocop checks.  At the time of MVP, the Rubocop checks all passed.

## Javascript

At this time there is no JavaScript testing or linting, as there is simply not enough JS code in the app to justify the effort. This should be reassessed over time.

## Testing

### Camaleon Testing

### Rest of App Testing

## Server Environments

## Git Commits

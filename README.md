[![<yiyili-community>](https://circleci.com/gh/yiyili-community/gooniyandi-backend.svg?style=svg)](https://app.circleci.com/pipelines/github/yiyili-community/gooniyandi-backend?branch=master)
## What is this?

[**Jila**](http://jilaframework.github.io) is a framework for building simple language learning apps. This particular repository is for the administrative backend and the API used to communicate with the app.

The **Jila** administration console is built using [Ruby on Rails](http://rubyonrails.org/) and the [ActiveAdmin](http://activeadmin.info/) framework.

## Prerequisites

- `Ruby 2.1.10` (best done via a Ruby version manager eg asdf, rbenv etc..)
- Or if you want to make life a little easier have `Docker` installed.

## Installation & Development

If you have Ruby running locally, Install Ruby gems
`bundle install`

#### Via Docker
To get the server running locally asap..

```bash
# Build and Run the Backend
> script/run_local.sh

# Stop the backend docker container
> docker kill admin-backend
```

The container will run all the db migrations locally onto a `sqlite db` which is inside the container.
This will build the container locally and run it. Go to `http://localhost:3000/` to view the admin interface.

## Production environment
The backend is a fairly vanilla Ruby on Rails application, so hosting arrangements can be whatever suits the user. The Gooniyandi backend uses [Heroku](http://www.heroku.com) for the production environment. Asset storage (images and audio) is configured to use [Bucketeer](https://elements.heroku.com/addons/bucketeer) - a Heroku add-on that uses S3 under the hood. The database is also provisioned using the [Heroku Postgres](https://elements.heroku.com/addons/heroku-postgresql) add-on.

The production environment uses [Paperclip](https://github.com/thoughtbot/paperclip) to upload the assets to S3. For each deployment environment you will have to set environment variables for the S3 bucket name, and the credentials, as outlined in **production.rb**.

### Deployment
The deployment in done via [Circle CI](https://app.circleci.com/pipelines/github/yiyili-community/gooniyandi-backend). Under the hood, it first builds the Dockerfile in the current directory and pushes the Docker image. Then, it releases the newly pushed image. Detailed information can be found here: https://devcenter.heroku.com/articles/container-registry-and-runtime

### Migration
The migration is also handled by the pipeline. If you wish to trigger it manually, you could follow the steps below:
1. install the heroku cli (https://devcenter.heroku.com/articles/heroku-cli)
2. run `heroku login` to authenticate
3. run `heroku run rake db:migrate -a gooniyandi-backend`

#### Seed initial data from Lexique
The seeding script is in `db/seeds.rb` so that it can access the Rails context (such as database connection string and so on).

The steps to run the Seeding script on the Heroku server from a clean state are:

1. Reset the database (go to Database in Heroku Web Admin, and hit "Reset" button)
2. To run migrate in the Heroku CLI: `heroku run rake db:migrate`
2. To run seed in the Heroku CLI: `heroku run rake db:seed`

#### Verify
To verify the data has been imported successfully, check the admin backend at `http://gooniyandi-backend.herokuapp.com/admin`

This step requires an Admin user (which might be removed after running db:migrate, depends on how "direction:up" is interpreted). To add the Admin user back:

i) `heroku run rails c` (access the Rails Console)
ii) In the Rails Console, run `AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')` (the same command can be found in devise_create_admin_users.rb in `db.migrate`)

## Customisation
The administration console is usable out of the box with no changes. If you do make changes, **please consider submitting a pull request so the community can benefit**.
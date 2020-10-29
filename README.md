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

## Deployment
The backend is a fairly vanilla Ruby on Rails application, so hosting arrangements can be whatever suits the user. The team have been using [Heroku](http://www.heroku.com) for both development/testing and production environments. Asset storage (images and audio) is configured to use [Amazon Simple Storage Service (S3)](http://aws.amazon.com/s3/) for production-like environments, and the local file system for development.

The production environment uses [Paperclip](https://github.com/thoughtbot/paperclip) to upload the assets to S3. For each deployment environment you will have to set environment variables for the S3 bucket name, and the credentials, as outlined in **production.rb**.

## Customisation
The administration console is usable out of the box with no changes. If you do make changes, **please consider submitting a pull request so the community can benefit**.
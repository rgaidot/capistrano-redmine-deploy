# capistrano-redmine-deploy

Capistrano recipes for [Redmine](http://redmine.org) deployment. 
WARN: currently, setup is not fully automated.

## Prerequisites

You need to have [rvm](http://rvm.io/) and ruby 2.1.2.

## Usage

1. Edit file .env

| Variables           | Descriptions                                         |
|---------------------|------------------------------------------------------|
| BRANCH              | Redmine branch                                       |
| DEPLOY_TO           | The path on the servers we’re going to be deploying  |
| WORKER              | Unicorn worker processes                             |
| HOST                | Server addresses                                     |
| USER                | SSH username                                         |

2. `bundle install`
3. `cap production server:install`
4. `cap production deploy`

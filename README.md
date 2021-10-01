## Smartflix

installation

- clone repo

`git clone git@github.com:eddsansome/smartflix.git`

- move into repo

`cd smartflix` 

- create .env file and add the `OMDB_API_KEY`

`echo OMDB_API_KEY=api-key >> .env`

- create docker installation

`docker-compose run --no-deps web rails new . --force --database=postgresql`

N.B we use latest minor version of ruby 2.7 within the docker setup (currently 2.7.4)

- start up the docker services

`docker-compose up`

- enjoy smartflix!

TODOS:
  - getting movies with ambigious names is a bit flaky, so need to tighten this up (some movies with spaces are ok, some aren't)
  - cron jobs for tidying up the DB
  
  - im sure a lot of the code could be refactored to make it ~~not as shit~~ tidier


Docker help:

- https://yizeng.me/2019/11/17/add-sidekiq-to-a-docker-compose-managed-rails-project/

- https://docs.docker.com/samples/rails/

- stackoverflow.com

- coffee

😅

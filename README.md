## Smartflix

Installation

### clone repo

```
git clone git@github.com:eddsansome/smartflix.git
```

### move into repo

```
cd smartflix
```

### install dependencies

```
bundle install
```

### create .env file and add the `OMDB_API_KEY`

```
echo OMDB_API_KEY=api-key >> .env
```

### create docker installation (this might not be needed if the --build tag is added in step 6)

```
docker-compose run --no-deps web rails new . --force --database=postgresql
```

### start up the docker services

```
docker-compose up --build
```

### open another terminal window (probs CTRL+t) and enter the following commands

```
docker-compose run web rake db:create
# then #
docker-compose run web rake db:migrate
```

### enjoy smartflix!

p.s

specs can be ran by using 
```
docker-compose run web bundle exec rspec`,
```

however you may need to clean out the VCR cassettes if they throw errors
```
cd spec/vcr_cassettes && rm -Ri *
```
then confirm the deletion (don't delete yo hard drive by mistake ^^)


TODOS:
  - ~~getting movies with ambigious names is a bit flaky, so need to tighten this up (some movies with spaces are ok, some aren't)~~
  - ~~seems to save the movie in the db, but cannot retrieve~~
  - ~~add a `slug` column to handle dodgy input~~
  - ~~cron jobs for tidying up the DB~~
  
  - im sure a lot of the code could be refactored to make it not as shit / tidier... WIP 😅
  - data normalization
     - Actor❌  
     - Genre ❌
     - Writer❌ 
     - Director✅
  - add specs


Docker help:

- https://yizeng.me/2019/11/17/add-sidekiq-to-a-docker-compose-managed-rails-project/

- https://docs.docker.com/samples/rails/

- stackoverflow.com

- coffee

😅

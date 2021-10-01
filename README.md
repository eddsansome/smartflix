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

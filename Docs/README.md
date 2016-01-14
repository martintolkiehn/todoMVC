docs readme

https://sleepy-citadel-1699.herokuapp.com/
https://git.heroku.com/sleepy-citadel-1699.git

heroku config:set BUILDPACK_URL=https://github.com/aergonaut/heroku-buildpack-coffeescript.git

heroku ps
heroku logs --tail

heroku ps:scale web=0
heroku ps:scale web=1

heroku local web



npm install
$ heroku local

$ git add .
$ git commit -m "Demo"
$ git push heroku master

$ heroku open cool




heroku create --buildpack https://github.com/aergonaut/heroku-buildpack-coffeescript.git
heroku config:set BUILDPACK_URL=https://github.com/sailrish/heroku-buildpack-coffeescript.git
heroku create --stack cedar-14 --buildpack https://github.com/sailrish/heroku-buildpack-coffeescript.git

heroku config:set BUILDPACK_URL=https://github.com/sailrish/heroku-buildpack-coffee.git
heroku buildpacks:set https://github.com/sailrish/heroku-buildpack-coffee

heroku apps:info -a sleepy-citadel-1699
heroku stack:set cedar-14 -a sleepy-citadel-1699

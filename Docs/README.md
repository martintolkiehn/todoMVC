docs readme

sleepy-citadel-1699
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


./node_modules/protractor/bin/webdriver-manager update

travis encrypt MY_SECRET_ENV=super_secret -r martintolkiehn/todoMVC

"JzIKaEqrNJi2T+WDJRleg0FpAHQEhi9b/lWT96VObwlwGUb+TygZ8s0Ewyg8EZ8VV3+gaTIGldO1p6bne54VcteAcZgINSItQtWYkPA/v/ISZQzCkP0RpppnFGFb10rewLLHqGzMWt8FwESnxDxW4ZN0xaLdi21mxzFptupM0NA5zMTbmekSQeKq8qRapBJfQoyB5aO8LaZWFn72ri/PxQwyPpanszMhLZQLNQHpymsmUWy2pUEn6uO23IpCVC3BZxkD88A+W2OT93GIrgf5P/5/xJ1nf+m/N51uhtvrF47ZKbkupH9+A3rwLgtRmpqUShKZm8lQoir/oc1d9CM8KukSnkmSQ2oJtph58tkgYBqY6W1cd12XQHOg4S6v3dxghoJo/Hw9Ovr6g0d9orhH7OEzNGqxZxU+jS39hUVkLYZa3PxBeEeSmgZdXB1d+sWIn2IqJ/Mk46z7CyxxyHxXylNedILDwRftV1vRbOiKS9orU4tifHnazZOjr/XI3tZ44j34xkSCxYqo3lFQUzCaithioLMgV82+GPQ2bhbbMR9BjAqPq8NfghKKAssD5umI41GEchuYLWBfNHXdm0cEe169yKAlNeCcWvAHCIH/8lLTnLyZ1EttXlZ1ne23TrHfQJ1B87e0IGuGRz/OOjmbRKYl8mF1OB6rR+HtQ8vUHZE="

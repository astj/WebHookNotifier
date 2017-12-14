# Usage

```
curl -d 'foo' http://foobar.herokuapp.com/notify
```

Will post `{ "text": "```foo```" }` to target Webhook URL. It can be used to inspect webhook payload.

# Setup

```
heroku create --buildpack http://github.com/pnu/heroku-buildpack-perl.git --stack cedar-14
heroku config:set WEBHOOK_URL=https://hooks.slack.com/services/XXX/YYY/ZZZ
git push heroku master
```

# Monitoring

```
heroku logs
```

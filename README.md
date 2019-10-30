## table schema 
- **user**
  - name: string

- **mission**
  - title: string
  - start_time: datetime
  - end_time: datetime
  - content: text
  - status: string
  - priority: integer
  - category: integer

## heroku deploy
```bash
$ heroku git:remote -a mission-control-5xruby
$ git push heroku master
$ heroku run bundle
$ heroku run rails db:migrate
```
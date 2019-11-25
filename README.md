## table schema 
- **User**
  - name: string
  - email: string
  - password_digest: string
  - remember_token: string
  - role: string
  - created_at: datetime
  - updated_at: datetime

- **Mission**
  - title: string
  - start_time: datetime
  - end_time: datetime
  - content: text
  - status: string
  - priority: integer
  - category: integer
  - created_at: datetime
  - updated_at: datetime
  - user_id: integer

- **Tag**
  - name: string
  - user_id: integer
  - created_at: datetime
  - updated_at: datetime

- **MissionTagLog**
  - mission_id: integer
  - tag_id: integer
  - created_at: datetime
  - updated_at: datetime

## heroku deploy
```bash
$ heroku git:remote -a mission-control-5xruby
$ git push heroku master
$ heroku run bundle
$ heroku run rails db:migrate
```

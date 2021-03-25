# API4Keratin

A bare bones Rails API application that uses Keratin's [authn-rb](https://github.com/keratin/authn-rb) gem to authenticate against a [Keratin AuthN](https://keratin.tech) Server.


# Requirements

* [Keratin Demo Server](https://keratin.tech/#getting-started) up and running

* [Postman](http://postman.com) or some other means hit the app with a JWT bearer token

* Built on Ruby version: 2.7.2 (but should work on other versions)

# Options

* RVM enabled (.ruby-gemset and .ruby-version provided)

* Postgres config is in database.yml; just commented out

# Configuration

Should be good to go unless you want to change databases or use some other instance of the Keratin server running on a different host or port

Any issues with Keratin: Check `config/initializers/keratin.rb`

# Initialization

 1. Run the Keratin "[Getting Started](https://keratin.tech/#getting-started)" docker command so that new users will be populated in the Keratin datbase

 2. Create and seed the rails database
```
rake db:create
rake db:migrate
rake db:seed"
```
This will create 3 sample users in the rails DB with logins in the Keratin DB:
| username          | login         |
| ----------------- |:-------------:|
| sam@snead.net     | SuperSecret   |
| holly@example.com | SuperSecret   |
| marty@example.com | SuperSecret   |


**NOTE:** *You must have the Keratin server running or the user's auth_uid will not be populated*

3. Start the rails app: `rails s`


# Operation

Once both the Keratin and Api4Keratin apps are initialized and running (see above):

 * Using any web browser, go to http://localhost:3000/login (or http://localhost:3000/*anything*, you will be redirected)

 * Log in as one of the sample users, above. This should return JSON from Keratin with an *id_token*, e.g.
 ```
 {"result":
  {"id_token":"eyJhbGciOiJSUzI1NiIsImtpZCI6InBjTTc5X19GNGZ6YWYzbmxvaTcxclltbTd0cDFDRkdJUThseC1mYUFMaWMiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOlsibG9jYWxob3N0Il0sImF1dGhfdGltZSI6MTYxNjY5NjA3OSwiZXhwIjoxNjE2Njk5Njc5LCJpYXQiOjE2MTY2OTYwNzksImlzcyI6ImxvY2FsaG9zdDo4MDgwIiwic3ViIjoiMyJ9.qks6MQpvbpAx-sJvbDSvfrfpmmmD6rWeRGEWdFrzKaXoTCfHAOJAEwQerycBU9W7-2EV4n5vxgDHl2G2niBdhqXDhuUJ2vbW7gqdEFToXmp4isVa-vE7VeEpUCpqTCFM0KcU43ipPGYjeegrNYsFj_oNzuH9iQMPEagBKQOa62pId4cXBajKxNoyrt6lezQdDJwTmkDr4XFhFmZZGwbHv_1BjCrR7UznkgAefEC7gnKKb_taJFCv0wH-a2hQvP_uNTQPnu-UBRVmTYwruF5iKy1I_FVFUs5dofZH_Fa0efqc9aFtqFEmwE-rpuvD0IzstzUpDxcdpB5pcRHQPvygng"}
}
 ```

 * Copy the returned id_token and with Postman (or similar) use it as a bearer token in the authenticatoin header and access the current user http://localhost:3000/current_user. It should return the user record that you logged in as.
 ```
 {
    "id": 1,
    "first_name": "Sam",
    "last_name": "Snead",
    "email": "sam@snead.net",
    "auth_uid": "1",
    "created_at": "2021-03-25T20:59:46.779Z",
    "updated_at": "2021-03-25T20:59:46.779Z"
}
```

* You can also hit the users endpoint to get a list of all users now: http://localhost:3000/users


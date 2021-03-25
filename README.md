# API4Keratin

A bare bones Rails API application that uses Keratin's [authn-rb|https://github.com/keratin/authn-rb] gem to authenticate against a [Keratin AuthN|https://keratin.tech] Server.


# Requirements

* RVM preferred (.ruby-gemset and .ruby-version provided)

* Built on Ruby version: 2.7.2 (but should work on other versions)

* sqlite (though the postgres gem)
* System dependencies

Meant to operate in conjunction with the [Keratin Authn Server](https://github.com/
keratin/authn-server).


* Configuration

* Database creation

Expecting postgres to be available

* Database initialization
```
rake db:create
rake db:migrate
rake db:seed"
```
Creates 3 sample users with logins:
| username          | login         |
| ----------------- |:-------------:|
| sam@snead.net     | right foo     |
| holly@example.com | right bar     |
| marty@example.com | right baz     |


* How to test the app

 * Create and seed the database, as above

 * Run the Keratin "[Getting Started|https://keratin.tech/#getting-started]" docker command in order to "log in"

 * Start the app (rails s)

 * go to http://localhost:3000/login

 * log in as one of the sample users, above. Should return JSON with an id_token, e.g.
 ```
 {"result":{"id_token":"eyJhbGciOiJSUzI1NiIsImtpZCI6InBjTTc5X19GNGZ6YWYzbmxvaTcxclltbTd0cDFDRkdJUThseC1mYUFMaWMiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOlsibG9jYWxob3N0Il0sImF1dGhfdGltZSI6MTYxNjY5NjA3OSwiZXhwIjoxNjE2Njk5Njc5LCJpYXQiOjE2MTY2OTYwNzksImlzcyI6ImxvY2FsaG9zdDo4MDgwIiwic3ViIjoiMyJ9.qks6MQpvbpAx-sJvbDSvfrfpmmmD6rWeRGEWdFrzKaXoTCfHAOJAEwQerycBU9W7-2EV4n5vxgDHl2G2niBdhqXDhuUJ2vbW7gqdEFToXmp4isVa-vE7VeEpUCpqTCFM0KcU43ipPGYjeegrNYsFj_oNzuH9iQMPEagBKQOa62pId4cXBajKxNoyrt6lezQdDJwTmkDr4XFhFmZZGwbHv_1BjCrR7UznkgAefEC7gnKKb_taJFCv0wH-a2hQvP_uNTQPnu-UBRVmTYwruF5iKy1I_FVFUs5dofZH_Fa0efqc9aFtqFEmwE-rpuvD0IzstzUpDxcdpB5pcRHQPvygng"}}
 ```

 * take the returned id_token and use it as a bearer token when accessing current user http://localhost:3000/current_user
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


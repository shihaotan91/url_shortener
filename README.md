# URL Shortener

## What does it do
Simple application to help shortern URLs and redirect user to the entered URL with the shortened one.

## How to set up
You need to have Rails, Node, Yarn and Postgres installed in your computer to run this application.

If you already have, you can just clone the repo and run these commands chronologically.

```
- bundle install
- rails db:create
- rails db:migrate
- rails db:seed
- rails db:seed RAILS_ENV=test << You need to run this for the tests to pass
- rails webpacker:install
- yarn install
```

After which, you should be able to run `rails s` to boot up the local server.

## How does it work

Go to `localhost:XXXX/links/new` to shorten a new URL.

If your URL is valid, it will redirect you to `localhost:XXXX/links/:id` to view the shortened URL.

You can then copy and paste the URL(eg. `localhost:XXXX/123asd`) on your browser to redirect you to the original page.

Entering a URL that doesn't have a valid short code will redirect you to the rails 404 page.

## Validating URLs

I followed bitly.com way of validating the given URL.

Leading https or www isn't required for the URL to be valid.

However, it must have a alphanumeric address and a valid domain name.

Examples of valid URLs

```
https://google.com,
www.nus.edu,
yahoo.sg
123456.io
```

Examples of invalid URLs

```
https://google,
www.google,
google,
google.invaliddomain
```

I've seeded a list of domain names to check if the given url is valid. 

The list can be found [HERE](https://data.iana.org/TLD/tlds-alpha-by-domain.txt).

You can look at the LongUrlValidator class for more information on how URLs are validated.

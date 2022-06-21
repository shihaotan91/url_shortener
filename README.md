# URL Shortener

## What does it do
Simple application to help shortern URLs and redirect user to the entered URL with the shortened one.

## How to set up
You need to have Rails, Node, Yarn and Postgres installed in your computer to run this application.

If you already do, you can just clone the repo and run these commands chronologically.

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

You can then click on the hyperlinked generated URL(eg. `localhost:XXXX/123asd`) on your browser to redirect you to the original page.

Entering a URL that doesn't have a valid short code will redirect you to the rails 404 page.

## Validating URLs

I followed bitly.com way of validating the given URL.

Leading https or www isn't required for the URL to be valid.

However, it must have a alphanumeric address and valid domain name(s).

Examples of valid URLs

```
https://google.sg
http://google.com.sg
www.google.kr
google.com
nus.edu.sg
```

Examples of invalid URLs

```
https://google
www.google
google
google.invalid
google.invalid.com
nus.edu.invalid
<><><><>.com
```

I've seeded a list of domain names to check if the given url is valid. 

The list can be found [HERE](https://data.iana.org/TLD/tlds-alpha-by-domain.txt).

You can look at the LongUrlValidator class for more information on how URLs are validated.

## Generating short URLs

I wanted to make sure that generated short URLs are all unique but not completely random.

So I added a `salt` column to the `Link` table and generated the short URLs by combining the salt with the long URLs.

This way, the short URLs can all be unique even if two `Links` are created with the same long URLs.

At the same time, if we somehow lose all the short URLs, we can still generate them again with the long URLs and salt. 

## Tests

Wrote tests for models, controllers and services.

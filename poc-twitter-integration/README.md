POC Twitter Integration
=======================

Sample Rails app to integratie with Twitter, post a tweet and display tweets.

Application
* Authorizes a user on Twitter with oAuth
* Fetches user profile data
* Posts a new tweet
* Displays the home timeline of the user
* Post of a tweet and timeline updates are using ajax
* Timeline uses memcached to store the timeline for 15 minutes or until a new post has been published

TODO
----
* More tests
* Consider TweetSteam for the timeline
* Solve the problem that the new tweet takes too long to be returned by the Twitter API. (e.g. fake it and filter)

Installation and Usage of Memcached
-----------------------------------

Remember, Dalli **requires** memcached 1.4+. You can check the version with `memcached -h`. Please note that memcached that Mac OS X Snow Leopard ships with is 1.2.8 and won't work. Install 1.4.x using Homebrew with

    brew install memcached

See further instructions during installation.

On Ubuntu you can install it by running:

    apt-get install memcached

You can verify your installation using this piece of code:

    gem install dalli

    require 'dalli'
    dc = Dalli::Client.new('localhost:11211')
    dc.set('abc', 123)
    value = dc.get('abc')


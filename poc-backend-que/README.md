POC Backend que
=======================

Sample Rails app to use a backend processing que and scheduler.

Application
* Authorizes a user on Twitter with oAuth
* Fetches user profile data
* Fetches trending places from Twitter API
* Signed-in user can select one or more places to monitor for Twitter trends.
* Displays the trends of the selected places and updates these regularly.
* Places can be removed from trends monitor.
* Twitter data uses memcached to store the places and trends between updates.
* Handles Twitter rate limit (15 calls per 15 minutes per user and method)
* Process que can be monitored

REQUIREMENTS
------------
- Redis
- Memcached

TODO
----
...

Installing Redis
----------------

Resque requires Redis 0.900 or higher.

Resque uses Redis' lists for its queues. It also stores worker state
data in Redis.

<a name='section_Installing_Redis_Homebrew'></a>
#### Homebrew

If you're on OS X, Homebrew is the simplest way to install Redis:

    $ brew install redis
    $ redis-server /usr/local/etc/redis.conf

You now have a Redis daemon running on 6379.


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


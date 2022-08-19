StaticCache
===========

This is a quick piece of middleware I wrote for [elliotcm.co.uk](http://elliotcm.co.uk) which sets the outbound cache headers of any URL referencing provided directories.  Useful for Heroku and other caching proxy situations.

It's probably been done before, hell it's probably already in Sinatra, but this was one of those situations where it seemed quicker to make it than to investigate a bunch of docs.

Edit: Archiving this as I switched to static files long ago.

Usage
-----

    require 'static_cache'
    use Middleware::StaticCache, 'images', 'fonts'

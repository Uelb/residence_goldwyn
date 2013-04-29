# Seablue Intranet

## Overview

This rails application allows the management of orders.

##Quick start

First, install the bundle of the application by launching `bundle install`.

##Seed the database
To import the currencies in the database, run
`rake db:seed`
You will then need to import the old database (normally in the project, you should have a file like old_database_utf8.sqlite). Run

`rake sage:import["filename"]`

It can take some time.

##Configure the search engine.
In order to allow search on the Po model, you should populate your index database. 
Generate a default configuration file:

````bash
rails generate sunspot_rails:install
````

If `sunspot_solr` was installed, start the packaged Solr distribution
with:

````bash
bundle exec rake sunspot:solr:start # or sunspot:solr:run to start in foreground
````

## Reindexing Objects

If you are using Rails, objects are automatically indexed to Solr as a
part of the `save` callbacks.

There are a number of ways to index manually within Ruby:
````ruby
# On a class itself
Person.reindex
Sunspot.commit

# On mixed objects
Sunspot.index [post1, item2]
Sunspot.index person3
Sunspot.commit

# With autocommit
Sunspot.index! [post1, item2, person3]
````

If you make a change to the object's "schema" (code in the `searchable` block),
you must reindex all objects so the changes are reflected in Solr:

````bash
bundle exec rake sunspot:solr:reindex

# or, to be specific to a certain model with a certain batch size:
bundle exec rake sunspot:solr:reindex[500,Post] # some shells will require escaping [ with \[ and ] with \]
````


##Configure the Websocket server
## Enabling Standalone Server Mode

You can enable the standalone server mode through the configuration option in your `events.rb` initializer file.

````ruby
# At the top of config/initializers/events.rb
WebsocketRails.setup do |config|
  config.standalone = true
end
````

If your redis server is not running on your localhost at the default port, override the redis options in your configuration as well.

````ruby
WebsocketRails.setup do |config|
   config.standalone = true
   config.redis_options = {:host => 'your.host', :port => '6379'}
end
````

By default, the standalone server will listen on port `3001`. Make sure you set the JavaScript client to connect to the correct port. You can override the default port in the configuration by setting the `standalone_port` option.

````ruby
WebsocketRails.setup do |config|
  config.standalone = true
  config.standalone_port = 3245
end
````

The javascript dispatcher will need to connect to `your.host:3001/websocket`.

````javascript
var dispatcher = new WebSocketRails('your.host:3001/websocket')
````

## Starting and Stopping the Standalone Server

You can start the standalone server with the `websocket_rails:start_server` rake task.

````
rake websocket_rails:start_server
````

All log output will be written to `log/websocket_rails.log`. If you have your `config.log_level` set to `:debug`, you will find the output in that file.

To stop the server, use the accompanying `websocket_rails:stop_server` rake task.

````
rake websocket_rails:stop_server
````

````ruby
WebsocketRails.setup do |config|
  config.standalone = true
  config.standalone_port = 3245
end
````
# Accela Ruby Client Library

This gem provides access to the HTTP Accela API. The project's primary goal is to emulate the ActiveRecord API as far as it makes sense against the Accela API.

## Models

Creating a new instance:

```ruby
Accela::Record.new
Accela::Record.new housing_units: 98
```

### Network based methods

The following methods communicate directly with the Accela REST API.

#### Creating a model

Here is an example workflow:

```ruby
input_record = Accela::Record.new housing_units: 829,
                                  type: { type.id = "Building-Commercial-Addition-NA" }
record = Accela::RecordAPI.create_record(input_record)
record.id # => "ISLANDTON-14CAP-00000-000CR"
```

#### Fetching models

Most models support the `all` and `find` methods. These work similar to ActiveRecord. `all` returns all records for a given type (with a few caveats). Find accepts an `id` paramater and returns a single instance with the given `id`.

```ruby
records = Accela::RecordAPI.get_all_records
records.length # => 25

record = Accela::RecordAPI.get_records("ISLANDTON-14CAP-00000-000CR")
record.name # => "D-I Builders Development Model Home"
```

## Development

To begin:

```shell
$ git clone git@github.com:d-i/accela-ruby.git
$ cd accela-ruby
$ bundle install
$ rake test
$ rake console
```

The built in Rake task `rake console` will load the gem and a development environment in a [Pry REPL](http://pryrepl.org/). If you plan on making authentication protected API calls, make sure to log in first. e.g.:

```ruby
Accela::API.connection.login("developer", "accela", "records addresses")
```

### Building the gem

```shell
$ rake gem
```

### Cleaning up VCR cassettes and gem build

```shell
$ rake clean
```

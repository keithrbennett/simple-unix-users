# SimpleUnixUsers

Reads and parses user information from /etc/passwd or a specified
filespec, and provides simple operations on the collection of users,
and individual users.

This code was written as an example of something Ruby could be useful
for when administering a Unix system.

It's just a starting point, and lacks necessary error checking and
polish.


## Installation

Add this line to your application's Gemfile:

    gem 'simple-unix-users'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple-unix-users
:w

## Usage

```ruby
require 'simple-unix-users'

users = Users.new
# or
users = Users.new('my-test-passwd-file')
```

Then you can use the services provided by the Users and User classes.


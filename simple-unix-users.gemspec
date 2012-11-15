# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple-unix-users/version'

Gem::Specification.new do |gem|
  gem.name          = "simple-unix-users"
  gem.version       = SimpleUnixUsers::VERSION
  gem.authors       = ["Keith R. Bennett"]
  gem.email         = ["keithrbennett@gmail.com"]
  gem.description   = %q{
Reads and parses user information from /etc/passwd or a specified
filespec, and provides simple operations on the collection of users,
and individual users.
 }
  gem.summary       = %q{Manages Unix user information based on the content of /etc/passwd.}
  gem.homepage      = "https://github.com/keithrbennett/simple-unix-users"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

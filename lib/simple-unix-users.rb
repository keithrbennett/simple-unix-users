require "simple-unix-users/version"

if /darwin/ === RUBY_PLATFORM
  $stderr.puts "

A message from the simple-unix-users gem...

Although simple-unix-users will read a passwd file on Mac OS,
it is not guaranteed to work correctly.  In addition, according to the Mac's
/etc/passwd file:

# Note that this file is consulted directly only when the system is running
# in single-user mode.  At other times this information is provided by
# Open Directory.

"
end

module SimpleUnixUsers
  require_relative 'simple-unix-users/user'
  require_relative 'simple-unix-users/users'
end

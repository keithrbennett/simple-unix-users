# This class is for illustrative purposes and lacks necessary error handling.

# Stores state, and provides some useful behavior, relating to a given user.
class User

  attr_accessor :name, :dummy_pw, :uid, :gid, :personal_data, :home_dir, :shell
  
  def initialize(line)
    @name, @dummy_pw, @uid, @gid, p_data, @home_dir, @shell = line.split(':')
    @personal_data = p_data.split(',')
    @shell.chomp!  # remove any trailing newline
  end

  def uid_number
    uid.to_i
  end

  def gid_number
    gid.to_i
  end

  def home_dir_size_in_mb
    `du -sm #{home_dir}`.to_i
  end

  def groups
    `groups #{name}`.chomp.split(':').last.strip.split(' ')
  end

end

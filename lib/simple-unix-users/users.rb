require_relative 'user'

# This class is for illustrative purposes and lacks necessary error handling.

# Manages a collection of users (instances of class 'User'),
# optionally loaded from /etc/passwd.
class Users < Array

  # Reads the user information from the passwd file, and returns
  # a Users instance.
  def self.from_passwd_file(filespec = '/etc/passwd')
    Users.new(File.readlines(filespec))
  end

  # Constructor; takes an array of passwd-formatted lines, or
  # User instances, or any combination thereof.
  def initialize(array)
    array.each do |element|
      user = element.is_a?(String) ? User.new(element) : element
      self << user
    end
  end

  # Methods that will return arrays of field objects (e.g. names).
  def names;          self.map(&:name)          end
  def uids;           self.map(&:uid)           end
  def gids;           self.map(&:gid)           end
  def personal_datas; self.map(&:personal_data) end
  def home_dirs;      self.map(&:home_dir)      end
  def shells;         self.map(&:shell)         end

  def uid_numbers;    self.map(&:uid_number)    end
  def gid_numbers;    self.map(&:gid_number)    end

  # Returns a new instance of Users containing only those users
  # whose shell is not '/bin/false'.
  def having_shell
    Users.new(select { |user| user.has_shell? })
  end

  def having_shell_of(shell)
    Users.new(select { |user| user.shell == shell })
  end

  def not_having_shell
    Users.new(self - having_shell)
  end

  def having_home
    Users.new(select { |user| user.has_home? })
  end

  def not_having_home
    Users.new(select { |user| ! user.has_home? })
    # or, less efficiently: Users.new(self - having_home)
  end

  # Returns a new Users instance consisting only of
  # those users having the specified group id.
  def having_gid(gid)
    gid = (gid.is_a?(Fixnum) ? gid.to_s : gid)
    filtered_array = (select { |user| user.gid == gid })
    Users.new(filtered_array)
  end

  def find_by_name(name)
    detect { |user| user.name == name }
  end

  def find_by_uid(uid)
    uid = uid.is_a?(String) ? uid : uid.to_s
    detect { |user| user.uid == uid }
  end
end



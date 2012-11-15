require 'rspec'

require_relative '../../lib/simple-unix-users/users.rb'

describe Users do

subject { Users.from_passwd_file }

it 'should load a list of users' do
  subject.should be_a Array
  subject.should_not be_empty
end

it 'should return a list of names for the names function' do
  names = subject.names.sort
  names.sort.uniq.size.should > 1
end

it 'should be able to get uids as numbers' do
  uid_numbers = subject.uid_numbers
  uid_numbers.should_not be_empty
  uid_numbers.first.should be_a(Fixnum)
end

end


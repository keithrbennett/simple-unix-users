require 'rspec'

require_relative '../../lib/simple-unix-users/users.rb'

describe Users do

subject { Users.from_passwd_file(File.join(File.dirname(__FILE__), 'passwd-sample')) }

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

it 'should be able to get gids as numbers' do
  gid_numbers = subject.gid_numbers
  gid_numbers.should_not be_empty
  gid_numbers.first.should be_a(Fixnum)
end

it 'should be able to get the field objects arrays' do
  [:names, :uids, :gids, :personal_datas, :home_dirs, :shells].each do |field|
    array = subject.send(field)
    array.size.should == subject.size
  end
end

it 'should calculate having_shell correctly' do
  num_with_shell = subject.inject(0) do |num, user|
    num += 1 if user.has_shell?
    num
  end
  subject.having_shell.size.should == num_with_shell
  subject.not_having_shell.size.should == (subject.size - num_with_shell)
end

it 'should correctly include users in having_shell_of' do
  first_user = subject.first
  subject.having_shell_of(first_user.shell).should include(first_user)
  subject.having_shell_of('ja;ksdfja;sdfkajsdf;k').should_not include(first_user)
end

it 'should correctly include users in having_home and not_having_home' do
  user_with_home_dir = subject.detect { |user| user.has_home_dir? }
  subject.having_home_dir.should include(user_with_home_dir)
  subject.not_having_home_dir.should_not include(user_with_home_dir) 
end

it 'should correctly find users with having_gid' do
  first_gid = subject.first.gid
  having_first_gid = subject.having_gid(first_gid)
  having_first_gid.should include(subject.first)
  
  first_user_with_different_gid = subject.detect { |user| user.gid != first_gid }
  having_first_gid.should_not include(first_user_with_different_gid)
end

it 'should find_by_name correctly' do
  last_user = subject.last
  subject.find_by_name(last_user.name).should == last_user
end

it 'should find_by_uid correctly' do
  last_user = subject.last
  subject.find_by_uid(last_user.uid).should == last_user
end

end


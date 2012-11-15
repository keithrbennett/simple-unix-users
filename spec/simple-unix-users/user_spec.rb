require 'rspec'

require_relative '../../lib/simple-unix-users/user'

describe User do

subject { User.new( 'kbennett:x:1000:1000:Keith Bennett,,,:/home/kbennett:/usr/bin/zsh') }

it 'should create correctly from the passwd line' do
  subject.class.should == User
end

it 'should create fields correctly' do
  subject.name.should == 'kbennett'
  subject.uid.should == '1000'
  subject.gid.should == '1000'
  subject.personal_data.first.should == 'Keith Bennett'
  subject.home_dir.should == '/home/kbennett'
  subject.shell.should == '/usr/bin/zsh'
end

it 'should detect an existing home correctly' do
  subject.has_home_dir?.should be_true
end

it 'should detect a nonexistent home correctly' do
  subject.home_dir = User::NULL_HOME_DIR
  subject.has_home_dir?.should be_false
end



end



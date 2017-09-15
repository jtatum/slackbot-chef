describe command '/opt/slackbot/bot.py --test' do
  its('exit_status') { should eq 0 }
  its('stdout') { should eq "test succeeded\n" }
end

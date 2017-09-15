describe command '/opt/slackbot/bot.py' do
  its('exit_status') { should eq 1 }
  its('stderr') { should match /invalid_auth/ }
end

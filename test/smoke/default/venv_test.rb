# # encoding: utf-8

describe command '/opt/slackbot/.env/bin/python -m slackbot.bot' do
  its('exit_status') { should eq 0 }
end

describe service('slackbot') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

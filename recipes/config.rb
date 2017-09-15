slackbot_dir = node['slackbot']['target_dir']

template "#{slackbot_dir}/slackbot_settings.py" do
  source 'slackbot_settings.py.erb'
  owner node['slackbot']['user']
  group node['slackbot']['group']
  mode '0600'
end

template "#{slackbot_dir}/bot.py" do
  source 'bot.py.erb'
  owner node['slackbot']['user']
  group node['slackbot']['group']
  mode '0500'
end

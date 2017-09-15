poise_service 'slackbot' do
  command "#{node['slackbot']['target_dir']}/bot.py"
  directory node['slackbot']['target_dir']
  user node['slackbot']['user']
end

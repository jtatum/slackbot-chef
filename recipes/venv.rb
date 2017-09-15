env_path = "#{node['slackbot']['target_dir']}/.env"

python_runtime node['slackbot']['python_ver'] do
  provider :system
end

python_virtualenv env_path do
  user node['slackbot']['user']
  group node['slackbot']['group']
end

python_package 'slackbot' do
  version '0.5.1'
end

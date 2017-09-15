#
# Cookbook:: slackbot-chef
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'slackbot::config' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |node|
        # override user and group on node
        node.normal['slackbot']['user'] = 'slackbot-user'
        node.normal['slackbot']['group'] = 'slackbot-group'
        node.normal['slackbot']['plugins'] = %w(plugin1 plugin2)
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates slackbot_settings.py' do
      expect(chef_run).to create_template('/opt/slackbot/slackbot_settings.py').with(
        user: 'slackbot-user',
        group: 'slackbot-group',
        mode: '0600'
      )
    end

    it 'creates bot.py' do
      expect(chef_run).to create_template('/opt/slackbot/bot.py').with(
        user: 'slackbot-user',
        group: 'slackbot-group',
        mode: '0500'
      )
    end

    it 'correctly defines plugins' do
      expect(chef_run).to render_file('/opt/slackbot/slackbot_settings.py')
        .with_content(/PLUGINS = \[\n    "plugin1",\n    "plugin2",\n\]/)
    end
  end
end

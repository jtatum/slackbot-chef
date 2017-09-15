name 'slackbot'
maintainer 'James Tatum'
maintainer_email 'jtatum@gmail.com'
license 'MIT'
description 'Installs/Configures a Python slackbot'
long_description ::IO.read(::File.join(::File.dirname(__FILE__), 'README.md'))
issues_url 'https://github.com/jtatum/slackbot-chef/issues'
source_url 'https://github.com/jtatum/slackbot-chef'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
supports 'ubuntu', '>= 14.04'

depends 'poise-python', '~> 1.6'
depends 'poise-service', '~> 1.5'

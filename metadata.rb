name 'slackbot'
maintainer 'James Tatum'
maintainer_email 'jtatum@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures a Python slackbot'
long_description 'Installs/Configures slackbot'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/jtatum/slackbot-chef/issues'
source_url 'https://github.com/jtatum/slackbot-chef'

depends 'poise-python', '~> 1.6'
depends 'poise-service', '~> 1.5'

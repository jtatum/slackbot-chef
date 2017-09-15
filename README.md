# slackbot-chef

[![Build Status](https://travis-ci.org/jtatum/slackbot-chef.svg?branch=master)](https://travis-ci.org/jtatum/slackbot-chef)

This cookbook creates a Python venv, installs and configures [slackbot](https://github.com/lins05/slackbot), and
creates and starts a service.

## Attributes

The following attributes are used (see attributes/default.rb for default values):

- `node['slackbot']['api_token']` - Slack API token
- `node['slackbot']['python_ver']` - version of Python (2 or 3)
- `node['slackbot']['target_dir']` - base directory for slackbot
- `node['slackbot']['user']` - user owner of files and service
- `node['slackbot']['group']` - group owner of files
- `node['slackbot']['plugins']` - list of plugins to load

## Recipes

### default

Includes the `venv`, `config`, and `service` recipes.

### venv

Installs system packages for Python, creates a virtual environment, and
installs slackbot into the virtualenv.

### config

Generates slackbot_settings.py and bot.py using the attribute data.

### service

Creates, enables, and starts a `slackbot` system service.

## Testing

### Linting and unit tests

`cookstyle` linting, `foodcritic` syntax checking, and `rspec` unit tests
can be invoked via `chef exec delivery local verify`.

### Test kitchen and InSpec

Test kitchen is configured for AWS. To use, you'll need working AWS
credentials (most easily configured via aws cli) and a .kitchen.local.yml:

```yml
driver:
  aws_ssh_key_id: key_id
  region: us-west-2
  availability_zone: b
  security_group_ids: ["sg-12345abcd"]
```

Test kitchen will work as normal with `kitchen build`, `kitchen converge`,
and `kitchen verify` to run InSpec tests. Alternately, systems with Docker
can use the dokken configuration with `export
KITCHEN_LOCAL_YAML=.kitchen.dokken.yml`. No additional configuration should
be required.

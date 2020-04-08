# frozen_string_literal: true

server '18.182.182.144', user: 'app', roles: %w[app db web]
set :ssh_options, keys: '/Users/yamamotoshou/.ssh/id_rsa'

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

use Rack::Reloader, 0
use Rack::Auth::Basic do |username, password|
  username == 'anton' || 'host' || 'top'
  password == '3'
end

run Rails.application
Rails.application.load_server

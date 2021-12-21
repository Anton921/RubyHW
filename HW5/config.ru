require './app/pet'

use Rack::Reloader, 0
use Rack::Auth::Basic do |username, password|
  username == 'anton' || 'host' || 'top'
  password == '3'
end

run Pet

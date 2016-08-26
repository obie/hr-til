# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)


use Rack::Throttle::Interval, min: 0.5, :key_prefix => :throttle
run Rails.application

load Rails.root.join('config/environments/production.rb')
require 'dalli'
require 'rack/throttle'

Rails.application.configure do
  config.cache_store = :dalli_store,
                      (ENV["MEMCACHIER_SERVERS"] || "").split(","),
                      {:username => ENV["MEMCACHIER_USERNAME"],
                       :password => ENV["MEMCACHIER_PASSWORD"],
                       :failover => true,
                       :socket_timeout => 1.5,
                       :socket_failure_delay => 0.2
                      }

end

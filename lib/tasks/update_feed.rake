require 'faraday'
require 'json'

task :update_feed do
  response = Faraday.get 'https://venmo.com/api/v5/public'
  feed = JSON.parse(response.body)['data']
  Feed.update_records(feed)
end
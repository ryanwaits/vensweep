class DashboardController < ApplicationController
  def index
    response = Faraday.get 'https://venmo.com/api/v5/public'
    feed = JSON.parse(response.body)['data']
    @feed = filter_by_keyword(feed)
  end

  private

  def filter_by_keyword feed
    keywords = ['food']
    feed.select{ |feed| (keywords & feed['message'].downcase.split(' ')).any? }
  end
end

class DashboardController < ApplicationController
  def index
    response = Faraday.get 'https://venmo.com/api/v5/public'
    feed = JSON.parse(response.body)['data']
    if filter_by_keyword(feed).empty?
      @feed = feed
    else 
      @feed = filter_by_keyword(feed)
    end
  end

  private

  def filter_by_keyword feed
    keywords = ['food']
    feed.select{ |feed| (keywords & feed['message'].downcase.split(' ')).any? }
  end
end

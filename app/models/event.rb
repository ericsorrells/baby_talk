class Event < ActiveRecord::Base

  def self.events(event_category, event_keyword, event_city, event_state, event_time)
    response = HTTParty.get "https://www.eventbriteapi.com/v3/events/search/?q=#{event_keyword}&venue.city=#{event_city}&venue.region=#{event_state}&categories=#{event_category}&date_modified.keyword=#{event_time}&token=#{ENV['API_KEY']}"
    return response['events']
  end
  
end

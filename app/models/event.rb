class Event < ActiveRecord::Base

  def self.events(event_category, event_keyword, event_city, event_state, event_time)
    response = HTTParty.get "https://www.eventbriteapi.com/v3/events/search/?q=#{event_keyword}&venue.city=#{event_city}&venue.region=#{event_state}&categories=#{event_category}&date_modified.keyword=#{event_time}&token=2JHYIBZXSHPPY7PLRDSO"
    return response['events']
  end
  
end
#HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?q=kids&venue.city=atlanta&venue.region=ga&categories=113&date_modified.keyword=this_week&token=2JHYIBZXSHPPY7PLRDSO")
require 'httparty'

class EventsController < ApplicationController
  def index
  end

  def show_events
    event_category = params[:category]
    event_keyword = params[:keyword]
    event_city = params[:city]
    event_state = params[:state]
    event_time = params[:time]
    
    @events = Event.events(event_category, event_keyword, event_city, event_state.upcase, event_time)

  end
  
end

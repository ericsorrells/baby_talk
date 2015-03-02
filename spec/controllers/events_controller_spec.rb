require 'rails_helper'

describe EventsController do
  
  describe 'GET #show_events' do
    it 'renders show_events' do
      get :show_events
      expect(response).to render_template(:show_events)
    end

    it 'returns an event' do
     # @events = Event.events(115, 'kids', 'Atlanta', 'GA', 'this_week')
    end
  end
end

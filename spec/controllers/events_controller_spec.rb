require 'rails_helper'

describe EventsController do
  
  describe 'GET #show_events' do
    it 'renders show_events' do
      get :show_events
      expect(response).to render_template(:show_events)
    end
  end
end

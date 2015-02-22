require 'rails_helper'

describe Event do
  describe 'events' do
    context 'receives arguments' do
      it 'should return correct event parameters' do
        local_event = Event.events(113, "kids", "Atlanta", "ga", "this_week")
        puts "LOCAL EVENT: #{local_event}"
        expect(local_event['events'][0]['venue']['address']['city']).to equal("Atlanta")
      end
    end
  end
end

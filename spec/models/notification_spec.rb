require 'rails_helper'

describe Notification do

  describe 'format phone number' do
    context 'when provided' do
        describe 'should be correct format' do
          number='+15555555555'
          formatted_num = Notification.format_phone_num(number)
      end
    end
  end
end
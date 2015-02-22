require 'rails_helper'

describe UsersController, type: :controller do
  describe '#new' do
    it 'renders New' do
      get :new, id:5
      expect(response).to render_template(:new)
    end
  end
end
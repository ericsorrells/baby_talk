require 'rails_helper'

describe BabiesController do
  
  describe 'GET #new' do
    it 'renders new' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end

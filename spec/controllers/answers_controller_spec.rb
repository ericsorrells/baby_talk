require 'rails_helper'

describe AnswersController, type: :controller do
    
let(:user){ User.create(id: 1, name: 'Eric', email: 'eric@email.com', 
                                phone: '4045555555', admin: nil) }
let(:question){ Question.create(id: 3, sequence: 1, content: 'lorem ipsum') }

  describe 'GET #index' do
    it 'renders Index' do
      get :edit
      expect(response).to render_template(:edit)
    end  
  end
end
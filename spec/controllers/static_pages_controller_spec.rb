require 'rails_helper'

describe StaticPagesController, type: :controller do
  describe '#home'  do
    it 'renders Home' do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe '#about' do
    it 'renders About' do
      get :about
      expect(response).to render_template(:about)
    end
  end

end
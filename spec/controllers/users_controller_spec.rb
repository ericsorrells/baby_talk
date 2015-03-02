require 'rails_helper'

describe UsersController, type: :controller do
  describe '#new' do
    it 'renders New' do
      get :new, id:5
      expect(response).to render_template(:new)
    end

    it 'assigns a new User' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

    describe 'POST #create' do
      context 'valid attributes' do
        it 'creates new user' do
          expect{
            post :create, user: FactoryGirl.attributes_for(:user)
            expect(response).to change(User, :count).by(1)
          }
        end

        it 'redirects to users#show' do
          post :create, user: FactoryGirl.attributes_for(:user)
          expect(response).to redirect_to(user_path(User.last.id))
        end
      end
    end
  
      context 'invalid attributes' do
        let(:invalid_attributes) { { name: '' } }

        it 'does not create new user' do
          expect {
            post :create, user: invalid_attributes
          }.to_not change(User, :count)
        end

        it 're-renders new' do
          post :create, user: invalid_attributes
          expect(response).to render_template(:new)
        end
      end

    describe 'GET #show' do
      let(:user) { FactoryGirl.create(:user) }

      it 'renders show' do
        get :show, id: user.id
        expect(response).to render_template(:show)
      end

      it 'assigned correct user' do
        get :show, id: user.id
        expect(assigns(:user)).to eq(user)
      end
    end

    describe 'GET #index' do
      let(:user1) { FactoryGirl.create(:user) }
      let(:user2) { FactoryGirl.create(:user) }

      it 'renders index' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #edit' do
      let(:user_for_edit) { FactoryGirl.create(:user) }

      before { sign_in user_for_edit, no_capybara: true }

      it 'renders edit' do
        get :edit, id: user_for_edit.id
        expect(response).to render_template(:edit)
      end

      it 'assigns correct user' do
        get :edit, id: user_for_edit.id
        expect(assign(:user)).to eq(user_for_edit)
      end 
    end

    describe 'PATCH #update' do
      let(:user_for_update) { FactoryGirl.create(:user, name: 'Jane Doe') }
      before {sign_in user_for_update, no_capybara: true }

      context 'valid attributes' do
        it 'updates user' do
          patch :update, id: user_for_update.id, user: { name: 'Jane Doe2'}
          user_for_update.reload
          expect(user_for_update.name).to eq('Jane Doe2')
        end
      end

        it 'redirect to users#show' do
          patch :update, id: user_for_update.id, user: { name: 'Jane Doe2' }
          expect(response).to redirect_to(user_for_update.id)
        end

      context 'invalid attributes' do
        it 'does not update user' do
          patch :update, id: user_for_update.id, user: { name: ' ' }
          user_for_update.reload
          expect(user_for_update.name).to eq('Jane Doe')
        end
      end

        it 're-renders edit' do
          patch :update, id: user_for_update.id, user: { name: '' }
          expect(response).to render_template(:edit)
        end

    describe 'DELETE #destroy' do
      it 'deletes requested user' do
        user_for_removal = User.create(name: 'Jane Doe', email: 'jd@email.com', 
                                       phone: '4041234567', password: 'foobar', 
                                       password_confirmation: 'foobar')

        sign_in user_for_removal, no_capybara: true

        expect{ delete :destroy, id: user_for_removal.id }.to change(User, :count).by(-1)
      end

      it 'redirects to index' do
        user_for_removal = FactoryGirl.create(:user)
        sign_in user_for_removal, no_capybara: true

        delete :destroy, id: user_for_removal.id
        expect(response).to redirect_to(users_url)
      end
    end

    end
end

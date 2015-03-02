require 'rails_helper'

describe "User pages" do
  subject { page }

  describe 'index' do
    User.destroy_all
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    before { visit users_path }

    it { should have_title('All Users') }
  end

  describe 'show' do
    let(:user) { FactoryGirl.create(:user) }

    before { visit user_path(user.id) }

    it { should have_title("Your Profile") }
  end

  describe 'signup page' do
    before { visit signup_path }
    it { should have_content('Sign Up') }

    describe 'create user' do
      let(:submit) { 'Create Account' }

      context 'valid information' do
        before do
          fill_in 'Name',                   with: 'Jane Doe'
          fill_in 'Email',                  with: 'jdoe@email.com'
          fill_in 'Phone',                  with: '4041234567'
          fill_in 'Password',               with: 'foobar'
          fill_in 'Password Confirmation',  with: 'foobar'
        end
      
        it 'creates user' do
          expect { click_button submit }.to change(User, :count).by(1)
        end
      end

      context 'invalid information' do
        it 'does not create user' do
          expect { click_button submit }.not_to change(User, :count)
        end

        describe 'after submission' do
          before { click_button submit }

          it { should have_title('Sign Up') }
          it { should have_content('error') }
        end
      end
    end  
  end

  describe 'signin page' do
    before { visit signin_path }
    it { should have_content('Sign In')}
  end

  describe 'edit user page' do
    let(:user_for_edit) { FactoryGirl.create(:user) }
    before do
      sign_in user_for_edit
      visit edit_user_path(user_for_edit.ed)
    end

    it { should have_title('Update Profile') }

    describe 'update user' do
      let(:submit) { 'Update Your Profile' }

      context 'valid information' do
        
        before do
          fill_in "Name", with: "Jane Doe2"
          clikc_button submit
        end

        describe 'after saving changes' do
          it { should have_title('Your Profile')}

          specify { expect(user_for_edit.reload.name).to eq('Jane Doe2') }
        end

      context 'invalid information' do
        before do
          fill_in "Name", with: '  '
          click_button submit
        end

        describe 'after submission' do
          it { should have_title('Update Profile') }
          it { should have_content('error') }
        end
      end

      end
    end
  end
end


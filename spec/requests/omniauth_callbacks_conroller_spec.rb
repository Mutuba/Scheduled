# spec/requests/users/omniauth_callbacks_spec.rb

require 'rails_helper'

RSpec.describe 'Users::OmniauthCallbacks', type: :request do
  describe 'GET /users/auth/google_oauth2/callback' do
    context 'when user is successfully authenticated' do
      it 'signs in the user and redirects to the root path' do
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
          provider: 'google_oauth2',
          uid: '123456',
          info: { email: 'user@example.com' }
        )

        get '/users/auth/google_oauth2/callback', params: OmniAuth.config.mock_auth[:google_oauth2]

        expect(response).to redirect_to(root_path)
        expect(flash[:success]).to be_present
        expect(controller.current_user).to be_present
      end
    end

    # context 'when user fails to authenticate' do
    #   it 'redirects to the sign-in path with an error message' do
    #     OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    #     # Simulate the entire OAuth callback process
    #     get '/users/auth/google_oauth2/callback'

    #     expect(response).to redirect_to(new_user_session_path)
    #     expect(flash[:alert]).to be_present
    #     expect(controller.current_user).to be_nil
    #   end
    # end
  end
end

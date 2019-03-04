require 'rails_helper'

RSpec.describe UserActivityController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  let!(:questions) { FactoryGirl.create(:question) }

  describe 'GET #questions' do
    context 'Fetch questions' do
      before do
        sign_in(user)
        get :questions
      end
      it { expect(JSON.parse(response.body).count).to eq(1) }
      it { expect(response).to have_http_status(:success) }
    end
  end
end

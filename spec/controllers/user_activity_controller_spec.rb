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
      it { expect(JSON.parse(response.body)[0]["title"]).to eq("When Do You Get The Most Done?") }
      it { expect(response).to have_http_status(:success) }
    end
  end

  describe 'POST #save_user_answers' do

    let(:params) do
      {
        user_answer: {
          question_id: questions.id,
          answer: questions.options[1]
        },
        token: user.confirmation_token
      }
    end

    before do
      post :save_user_answers, params: params, format: :json
    end

    it { expect(response.body).to eq("answer save successfully.") }
  end
end

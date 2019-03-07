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
      it_behaves_like 'a successfull page render', 'questions'
      it { expect(response).to have_http_status(:success) }
    end
  end

  describe 'POST #save_user_answers' do

    context 'With all require params' do
      let(:params) do
        {
          user_answer: {
            question_id: questions.id,
            answer: questions.options[1]
          },
        }
      end

      before do
        sign_in(user)
        post :save_user_answers, params: params, format: :json
      end

      it { expect(response.body).to eq("answer save successfully.") }
    end

    context 'when user is not select any answer' do
      let(:params) do
        {
          user_answer: {
            question_id: questions.id,
          },
        }
      end

      before do
        sign_in(user)
        post :save_user_answers, params: params, format: :json
      end
      it { expect(response.body).to eq("Answer can't be blank") }
    end
  end

  describe 'GET #finish' do
    context 'Finshed page' do
      before do
        sign_in(user)
        get :finish
      end
      it_behaves_like 'a successfull page render', 'finish'
      it { expect(response).to have_http_status(:success) }
    end
  end
end

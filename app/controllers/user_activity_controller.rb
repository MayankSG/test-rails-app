class UserActivityController < ApplicationController
  layout :resolve_layout
  before_action :authenticate_user!

  def save_user_answers
    user_answer = UserAnswer.new(user_answer_params)
    user_answer.user_id = current_user.id
    if user_answer.save
      msg = flash.now[:success] = "answer save successfully."
    else
      msg = user_answer.errors.full_messages.join(', ')
    end
    render json: msg
  end

  def questions
    @ques = Question.all
  end

  def finish
  end

  private
  def user_answer_params
    params.require(:user_answer).permit(:question_id, :user_id, :answer)
  end

  def resolve_layout
    if user_signed_in?
      'application'
    else
      'blank'
    end
  end
end

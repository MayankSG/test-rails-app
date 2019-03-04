FactoryGirl.define do

  factory :user_answer do
    question
    user
    answer { 'Late at Night' }
  end
end

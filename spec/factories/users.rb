# frozen_string_literal: true

FactoryGirl.define do

  factory :user do
    email
    password 'foobar'
    confirmed_at Time.now
    confirmation_token "ZYz5zWsicLnsAKgVFD4U"
  end

end

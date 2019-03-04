# frozen_string_literal: true

# Overrides for Device's RegistrationsController
class UserRegistrationsController < Devise::RegistrationsController

  respond_to :json

  def create
   build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      resource.confirm
      render json: resource.confirmation_token
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: resource.errors.full_messages
    end
  end

  protected

  def after_sign_up_path_for(_resource)
    sign_up_success_path
  end

  def after_inactive_sign_up_path_for(_resource)
    sign_up_unconfirmed_path
  end

  def after_update_path_for(_resource)
    my_profile_path
  end

end

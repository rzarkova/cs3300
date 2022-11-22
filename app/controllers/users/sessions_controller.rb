# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  #GET /users/sign_in
  #def new
  #  super
  #end

  #POST /users/sign_in
  #def create
  #  super do |resource|
  #    BackgroundWorker.trigger(resource)
  #  end
  #end

  #DELETE /users/sign_out
  #def destroy
  #  @user.destroy

  # respond_to do |format|
  #    format.html { redirect_to projects_url, notice: "User was successfully destroyed." }
  #    format.json { head :no_content }
  #  end
  #end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

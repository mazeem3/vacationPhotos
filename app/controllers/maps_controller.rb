class MapsController < ApplicationController
  before_action do
      redirect_to sign_in_path, notice: 'Please Sign in' if @current_user.nil?
  end


  def show
  end
end

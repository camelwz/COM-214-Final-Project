class SettingsController < ApplicationController
  before_action :require_login  # ensure only logged-in users access it

  def show
    @user = current_user
  end
end
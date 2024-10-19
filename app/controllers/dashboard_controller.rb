class DashboardController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated before accessing the dashboard

  def index; end
end

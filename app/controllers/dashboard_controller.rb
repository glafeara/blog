class DashboardController < ApplicationController

  before_action :signed
  before_action :is_admin

  def index
    @top_autors = User.group(:email).order(articles_count: :desc).limit(5).sum(:articles_count)
  end

end

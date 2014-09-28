class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_categories

  include SessionsHelper

  private

  def get_categories
    @all_categories = Category.all
  end

  def get_categories
    @all_categories = Category.all
  end
 
end

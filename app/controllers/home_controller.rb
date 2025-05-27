class HomeController < ApplicationController
  def index
    # Make sure we load tweets for all users, not just logged-in ones
    @tweets = Tweet.includes(:user, :likes).order(created_at: :desc)
  end

  def about
  end
end

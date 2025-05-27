class LikesController < ApplicationController
  before_action :require_login

  def create
    @tweet = Tweet.find(params[:tweet_id])
    current_user.likes.create(tweet: @tweet)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.find_by(tweet: @tweet)
    like&.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end
end

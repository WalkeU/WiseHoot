class TweetsController < ApplicationController
  before_action :require_login, only: [ :create, :destroy ]

  def create
    current_user.tweets.create(content: params[:content])
    redirect_to root_path
  end

  def destroy
    if current_user.username == "admin"
      Tweet.find(params[:id]).destroy
    end
    redirect_to root_path
  end
end

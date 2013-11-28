class TweetsController < ApplicationController
  def index
    @query = params[:query]

    @tweets = Tweet.order('created_at DESC')
    if @query.present?
      @tweets = @tweets.where('body like ?', "%#{@query}%")
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:author, :body)
  end
end

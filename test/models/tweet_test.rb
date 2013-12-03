require "test_helper"

class TweetTest < ActiveSupport::TestCase
  def test_valid
    tweet = Tweet.new(body: "My body")
    assert tweet.valid?
  end

  def test_body_required
    tweet = Tweet.new
    tweet.body = nil
    refute tweet.valid?
  end
end

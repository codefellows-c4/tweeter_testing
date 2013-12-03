require "test_helper"

class TweetsControllerTest < ActionController::TestCase

  def test_index
    get :index
    assert_response 200
  end

  def test_new
    get :new
    assert_response 200
  end

  def test_create
    params = {
      "tweet" => {
        "author"=>"Matt",
        "body"=>"My Message"
      }
    }
    assert_difference "Tweet.count" do
      post :create, params
    end
    assert_redirected_to root_url
    assert_equal "Tweet created!", flash[:notice]
  end
  def test_create_fail
    params = {
      "tweet" => {
        "author"=>"Matt",
        "body"=>""
      }
    }
    assert_no_difference "Tweet.count" do
      post :create, params
    end
    assert_template "new"
  end
end

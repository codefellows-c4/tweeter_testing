class Tweet < ActiveRecord::Base
  validates :body, presence: true
end

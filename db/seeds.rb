Tweet.create!(author: 'John', body: "First post!")
Tweet.create!(author: 'Steve', body: "Buy this product here.")

50.times do |index|
  Tweet.create!(author: "Chris #{index}", body: "Post number #{index}")
end
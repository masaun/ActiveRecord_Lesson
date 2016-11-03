require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./blog.db"
)

class Post < ActiveRecord::Base
end


# 書き方①
# post = Post.new(:title => "title1", :body => "hello1")
# post.save


# 書き方②
# post = Post.new
# post.title = "title2"
# post.body = "hello2"
# post.save


# 書き方④（pブロックの中で挿入する方法）
# post = Post.new do |p|
#   p.title = "title3"
#   p.body = "hello3"
# end
# post.save

# 書き方⑤（newとsaveを同時にやってくれる書き方）
Post.create(:title => "title1", :body => "hello1")

p Post.all
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
# Post.create(:title => "title1", :body => "hello1")



# DB内のすべての値を取ってくる
# p Post.all

# DB内の最初のレコードをとっってくる
# p Post.first

# 一番最後に挿入したtitleレコードを呼び出したい時
# p Post.last.title

# IDを指定して呼び出したい時：findメソッド
# p Post.find(3)

#特定のフィールド名を指定して呼び出したい時：find_by_フィールド名メソッド
# p Post.find_by_title("title2")

#複数の条件で特定のフィールドを呼び出したい時：find_by_レコード名_and_レコード名（" フィールド名", "フィールド名"）
p Post.find_by_title_and_id("title2", 2)

# ※もし該当するフィールドがなければ、nilが返ってくる
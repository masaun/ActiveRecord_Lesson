require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./blog.db"
)

class Post < ActiveRecord::Base
end


# idとtitleを指定して呼び出す書き方
# p Post.where(:title => "title1", :id => 1)


# 最初に？マークを使ってレコードを指定。続いて、その中で取り出したいフィールド名を指定する書き方
# p Post.where("title = ? and id = ?", "title1", 1)


# シンボルを使った記述方法（どれがどれに対応しているか分かりやすくする）
# p Post.where("title= :title and id = :id", {:title => "title1", :id => 1})


#不等号条件を指定
# p Post.where("id > ?", 2)


# 全レコードが選択される
p Post.where("body like ?", "hello%")
require 'active_record'

#どんなSQLが発行されているかターミナルでみれる
require 'logger'


ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./blog.db"
)

#どんなSQLが発行されているかターミナルでみれる（上記の記述と合わせて使用する。カッコ内はファイル名を指定することもできる。ここでは標準出力を指定）
ActiveRecord::Base.logger = Logger.new(STDOUT)


class Post < ActiveRecord::Base
end



post = Post.find(1)

# 一つのフィールドを更新したい時
# post.update_attribute(:title, "(new)title1")


# 複数のフィールをを更新したい時は、attributeを複数形にする。
# post.update_attributes(:title => "nnn", :body => "hhh(new)title1")


# 指定した範囲のフィールドを全て更新したい時
Post.where(:id => 1..2).update_all(:title => "nnn2", :body => "hhh2")
p Post.all

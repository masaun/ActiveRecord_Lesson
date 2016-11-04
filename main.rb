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
  vailidates :title, :presence => true
  vailidates :body, :length => { :minimum => 5 }
end

post = Post.new(:body => "123")

#saveされない場合は、エラーメッセージを表示する
if !post.save
  p Post.errors.messages
end

p Post.all



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


# 指定した含意を全て消したい場合
#Post.where(:id => 1..2).delete_all

#全て削除したい場合は、destroy_allを使う。
Post.find(3).destroy
p Post.all
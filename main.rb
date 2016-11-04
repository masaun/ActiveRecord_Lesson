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


# first_or_createメソッドを使うと、指定したフィールド名が存在する場合はその値を抽出。存在しない場合は新しく作ってくれる。
# Post.where(:title => "title5").first_or_create
# p Post.all


# もし指定したフィールド名が存在する場合はその値を抽出。存在しない場合はpの中でbodyの値も作ってくれる。。
Post.where(:title => "title6").first_or_create do |p|
  p.body = "hello6"
end

p Post.all




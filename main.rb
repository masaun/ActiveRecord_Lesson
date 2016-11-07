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
  has_many :comments, :dependent => :destroy
end

class Comment < ActiveRecord::Base
  belongs_to :post
end

p Post.all
p Comment.all

Post.find(1).destroy

p Post.all
p Comment.all

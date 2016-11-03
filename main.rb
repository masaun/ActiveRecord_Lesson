require 'active_record'

#どんなSQLが発行されているかターミナルでみれる
require 'logger'


ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./blog.db"
)

#どんなSQLが発行されているかターミナルでみれる（上記の記述と合わせて使用する）
ActiveRecord::Base.logger = Logger.new(STDOUT)


class Post < ActiveRecord::Base
  scope :top3, -> {order("created_at").limit(3)}
end


# idの１〜３を抽出したい時
# p Post.where(:id => 1..3)


# idの１と３を飛び飛びに抽出したい時：配列構造にする
# p Post.where(:id => [1, 3])


# idを降順に並び替え、上から3つ目までを抽出したい時。
# p Post.order("id desc").limit(3)


# scopeで指定された範囲で、指定された条件のレコードを抽出する
p Post.top3




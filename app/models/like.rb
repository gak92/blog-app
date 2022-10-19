class Like < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: true

  def update_likes_counter
    post.increment!(:likes_counter)
  end

end

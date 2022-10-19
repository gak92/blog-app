class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: true

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end

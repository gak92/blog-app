class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_save :update_comments_counter
  after_destroy :decrease_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def decrease_comments_counter
    post.decrement!(:comments_counter)
  end
end

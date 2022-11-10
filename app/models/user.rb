class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # has_many :posts, foreign_key: 'author_id'
  # has_many :comments, foreign_key: 'author_id'
  # has_many :likes, foreign_key: 'author_id'
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'

  after_initialize :init

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def init
    self.posts_counter ||= 0
  end
end

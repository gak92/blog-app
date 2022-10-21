require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  user = User.create(name: 'Harry', photo: 'https://unsplash.com/photos/pHPzdEHN6Os', bio: 'Web Designer')
  post = Post.new( author: user, title: 'Full Stack Tutorial', text: 'This is complete tutorial', comments_counter: 3,
    likes_counter: 2)
  
  describe 'Method Update comments counter' do
    before { post.comments_counter = 5 }
    it 'should increment the comments counter' do
      comment = Comment.new(post: post)
      comment.update_comments_counter
      expect(post.comments_counter).to eq(6)
    end
  end

end

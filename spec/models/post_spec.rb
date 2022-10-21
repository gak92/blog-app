require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Harry', photo: 'https://unsplash.com/photos/pHPzdEHN6Os', bio: 'Web Designer')
  describe 'Validation' do
  
    it 'Post should be valid' do
      post = Post.new( author: user, title: 'Full Stack Tutorial', text: 'This is complete tutorial', comments_counter: 3,
        likes_counter: 2)
      expect(post).to be_valid
    end
  
    it 'Post should not be valid' do
      post = Post.new( author: user, title: 'Full Stack Tutorial', text: 'This is complete tutorial', comments_counter: 3,
        likes_counter: "two")
      expect(subject).to_not be_valid
    end
  end

  describe 'Method Update post counter' do
    before { user.posts_counter = 3 }
    it 'should increment the post counter' do
      post = Post.new( author: user, title: 'Full Stack Tutorial', text: 'This is complete tutorial', comments_counter: 3,
        likes_counter: 2)
      post.update_posts_counter
      expect(user.posts_counter).to eq(4)
    end
  end

  describe "Method recent comment should return latest 5 comments" do 
    post = Post.create(author_id: user.id, title: 'Full stack Tutorial', text: 'This is complete tutorial', comments_counter: 3,
      likes_counter: 2)
    before { 6.times {|n| Comment.create(post_id:post.id, author_id: user.id, text: "Hi comment #{n}")} }
    it 'should return 5 recent comments' do
      expect(post.recent_comments).to eq(post.comments.last(5))
    end
  end

end


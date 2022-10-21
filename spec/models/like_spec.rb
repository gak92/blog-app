require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Harry', photo: 'https://unsplash.com/photos/pHPzdEHN6Os', bio: 'Web Designer')
  post = Post.new(author: user, title: 'Full Stack Tutorial', text: 'This is complete tutorial', comments_counter: 3,
                  likes_counter: 2)

  describe 'Method Update comments counter' do
    before { post.likes_counter = 7 }
    it 'should increment the likes counter' do
      like = Like.new(post:)
      like.update_likes_counter
      expect(post.likes_counter).to eq(8)
    end
  end
end

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /new' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                          bio: 'Teacher from Mexico', posts_counter: 0)

      @post1 = Post.create(author: @user, title: 'Timmy Jimmy', text: 'Hey Jimmy jimmy', likes_counter: 0,
                           comments_counter: 0)

      @comment1 = Comment.create(author: @user, post: @post1, text: 'Hi guys')
      @comment2 = Comment.create(author: @user, post: @post1, text: 'hey')
      @comment3 = Comment.create(author: @user, post: @post1, text: 'hey')

    end
    it 'returns http success' do
      get "/users/#{@user.id}/posts/#{@post1.id}"
      expect(response).to have_http_status(:success)
    end
  end
end

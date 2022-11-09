require 'rails_helper'

RSpec.describe 'User post', type: :feature do
  describe 'User post show page' do
    before(:example) do
      @user = User.create(name: 'Jerry', photo: 'https://picsum.photos/id/149/150/150', bio: 'Teacher',
                          posts_counter: 1)
      @post = Post.create(author: @user, title: 'Post_1 Title', text: 'First post description', comments_counter: 0,
                          likes_counter: 0)
      @comment = Comment.create(post: @post, author: @user, text: 'This is first comment!')
      visit user_post_path(@user.id, @post)
    end

    it 'can see a post title' do
      expect(page).to have_content(@post.title)
    end

    it 'can see who wrote the post' do
      expect(page.html).to have_content(@user.name)
    end

    it 'can see how many comments a post has' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'can see how many likes a post has' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'can see some of the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'can see the username of each commentor' do
      expect(page).to have_content(@comment.author.name)
    end

    it 'can see the comment each commentor left' do
      expect(page).to have_content(@comment.text)
    end
  end
end

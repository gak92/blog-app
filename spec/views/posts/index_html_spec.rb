require 'rails_helper'

RSpec.describe 'User post', type: :feature do
  describe 'User post index page' do
    before(:example) do
      @user = User.create(name: 'Jerry', photo: 'https://picsum.photos/id/149/150/150', bio: 'Teacher',
                          posts_counter: 1)
      @post = Post.create(author: @user, title: 'Post_1 Title', text: 'First post description', comments_counter: 0,
                           likes_counter: 0)
      @comment = Comment.create(post: @post, author: @user, text: 'This is first comment!')
      visit user_posts_path(@user)
    end

    it 'can see the user profile picture' do
      expect(page.html).to include(@user.photo)
    end

    it 'can see the user username' do
      expect(page.html).to have_content(@user.name)
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_content(@user.posts_counter)
    end

    it 'can see a post title' do
      expect(page).to have_content(@post.title)
    end

    it 'can see some of the post body' do
      expect(page).to have_content(@post.text)
    end

    # it 'can see the first comments on a post' do
    #   expect(page).to have_content(@comment.text)
    # end

    it 'can see how many comments a post has' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'can see how many likes a post has' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'When I click on a post, it redirects me to that post show page' do
      click_link @post.title
      expect(page).to have_current_path(user_post_path(@user.id, @post))
    end
  end
end
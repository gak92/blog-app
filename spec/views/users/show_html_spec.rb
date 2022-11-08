require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'User show page' do
    before(:example) do
      @user = User.create(name: 'Jerry', photo: 'https://picsum.photos/id/149/150/150', bio: 'Teacher',
                          posts_counter: 1)
      @post1 = Post.create(author: @user, title: 'Post_1 Title', text: 'First post description', comments_counter: 0,
                           likes_counter: 0)
      @post2 = Post.create(author: @user, title: 'Post_2 Title', text: 'Second post description', comments_counter: 0,
                           likes_counter: 0)
      @post3 = Post.create(author: @user, title: 'Post_3 Title', text: 'Third post description', comments_counter: 0,
                           likes_counter: 0)
      visit user_path(@user)
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

    it 'can see the user bio' do
      expect(page).to have_content(@user.bio)
    end

    it 'can see the user first 3 posts' do
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
    end

    it 'can see a button that lets me view all of a user posts' do
      expect(page).to have_content('See all posts')
    end

    it 'When I click a user post, it redirects me to that posts show page' do
      click_link @post1.title
      expect(page).to have_current_path(user_post_path(@user.id, @post1))
    end

    it 'When I click to see all posts, it redirects me to the user post index page' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end

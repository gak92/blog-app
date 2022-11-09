require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'User index page' do
    before(:example) do
      @user = User.create(name: 'Jerry', photo: 'https://picsum.photos/id/149/150/150', bio: 'Teacher',
                          posts_counter: 1)
      visit users_path
    end

    it 'can see the username of all other users' do
      expect(page).to have_content(@user.name)
    end

    it 'can see the profile picture for each user' do
      expect(page.html).to include(@user.photo)
    end

    it 'can see the number of posts each user has written' do
      expect(page).to have_content(@user.posts_counter)
    end

    it 'When I click on a user, I am redirected to that user show page' do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))
    end
  end
end

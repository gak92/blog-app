require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Harry', photo: 'https://unsplash.com/photos/pHPzdEHN6Os', bio: 'Web Designer') }
    before { subject.save }
  
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'photo should be present' do
      subject.photo = nil
      expect(subject).to_not be_valid
    end

    it 'bio should be present' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    describe 'Should return 3 recent post' do
      before { 4.times { |n| Post.create(author_id: subject.id, title: "Post #{n}", text: "Post Decrtiption") } }
  
      it 'User should have 3 recent posts' do
        expect(subject.recent_posts).to eq(subject.posts.last(3))
      end
    end

end

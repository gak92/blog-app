require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { User.new(name: 'Harry', photo: 'link', bio: 'designer') }
    before { subject.save }
  
    it 'name should be Harry' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

end

require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(User.new(email: 'elisha@test.com', password: '123456e')).to be_valid
    end
  end
end

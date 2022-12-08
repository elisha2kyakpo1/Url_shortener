require 'rails_helper'

RSpec.describe Url, type: :model do

  subject {
    Url.create(long_url: "https://www.google.com", short_url: "ssehdj", user_id: 1);
  }

  before {
    subject.save
  }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a long url' do
      expect(Url.new).to_not be_valid
    end

    it 'is not valid without a short url' do
      expect(Url.new(long_url: 'https://www.google.com')).to_not be_valid
    end

    it 'is not valid with a long url that is not a valid url' do
      expect(Url.new(long_url: 'www.google.com')).to_not be_valid
    end

    it 'is not valid with a short url that is too long' do
      expect(Url.new(long_url: 'https://www.google.com', short_url: '12345678901234567890')).to_not be_valid
    end
  end

  describe 'callbacks' do
    it 'should generate a short url before creation' do
      url = Url.create(short_url: 'https://www.google.com')
      expect(url.short_url).to_not be_nil
    end
  end

  describe 'class methods' do
    it 'should return the top 10 most clicked links' do
      user = User.create(email: 'elisha@gmail.com', password: '123456')
      10.times do |i|
        Url.create(long_url: "https://www.google.com/#{i}", user_id: user.id, click: i + 1)

      end
      expect(Url.most_clicked.count).to eq(10)
    end
  end
end

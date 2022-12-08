FactoryBot.define do
  factory :url do
    name { 'Elisha' }
    long_url { 'https://www.theodinproject.com/lessons/ruby-common-data-structures-and-algorithms' }
    short_url { 'MyString' }
    click { 1 }
    user { User.create(email: 'elisha@test.com', password: '123456e') }
  end
end

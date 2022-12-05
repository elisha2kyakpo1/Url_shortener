FactoryBot.define do
  factory :url do
    name { 'MyString' }
    long_url { 'MyString' }
    short_url { 'MyString' }
    click { 1 }
    user { nil }
  end
end

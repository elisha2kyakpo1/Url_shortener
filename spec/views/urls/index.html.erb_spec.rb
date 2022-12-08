require 'rails_helper'

RSpec.describe 'urls/index.html.erb', type: :view do
  
  before(:each) do
    @user = User.new('elisha@test.com', '123456e')
    @user.save
    @url = Url.new('https://www.google.com', @user.id)
    @url.save
    @url2 = Url.new('https://www.google.com', @user.id)
    @url2.save
    @url3 = Url.new('https://www.google.com', @user.id)
    @url3.save

    @urls = [@url, @url2, @url3]

    assign(:urls, @urls)

    render template: 'urls/index.html.erb'
  end
end

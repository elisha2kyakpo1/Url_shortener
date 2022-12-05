require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/urls/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/urls/new"
      expect(response).to have_http_status(:success)
    end
  end

end

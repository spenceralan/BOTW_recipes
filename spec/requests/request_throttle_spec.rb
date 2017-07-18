require 'rails_helper'

describe "get response with request throttling", :type => :request do
  let!(:user) { FactoryGirl.create(:user) }

  it 'returns status code 200 when searching by name' do
    10.times do
      get '/ingredients', params: { token: user.token, name: "Big" }
    end
    expect(response.status).to eq(429)
  end

end

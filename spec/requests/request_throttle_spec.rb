require 'rails_helper'

describe "get response with request throttling", :type => :request do
  let!(:user) { FactoryGirl.create(:user) }

  it 'returns status code 429 when requests exceed limit' do
    limit = Rack::Attack::LIMIT
    (limit*2).times do
      get '/ingredients', params: { token: user.token, name: "Big" }
    end
    expect(response.status).to eq(429)
    expect(response.body).to eq("Retry later\n")
  end

  # it 'returns status code 429 when requests exceed limit' do
  #   10.times do
  #     get '/ingredients', params: { token: user.token, name: "Big" }
  #   end
  #   expect(response.status).to eq(429)
  #   expect(response.body).to eq("Retry later\n")
  # end



end

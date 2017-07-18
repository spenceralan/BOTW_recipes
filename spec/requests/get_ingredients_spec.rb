require 'rails_helper'

describe "get all ingredients route", :type => :request do
  let!(:user) { FactoryGirl.create(:user) }

  it 'returns status code 200 when searching by name' do
    get '/ingredients', params: { token: user.token, name: "Big" }
    expect(response).to have_http_status(:success)
  end

  it 'returns status code 200 when searching by base_hearts_recovered' do
    get '/ingredients', params: { token: user.token, base_hearts_recovered: 1 }
    expect(response).to have_http_status(:success)
  end

  it 'returns status code 200 when searching with multiple parameters' do
    get '/ingredients', params: { token: user.token, base_hearts_recovered: 1, name: "Big" }
    expect(response).to have_http_status(:success)
  end

  it 'returns status code 401 when token is invalid' do
    get '/ingredients', params: { token: "hiI'mSpencer123", base_hearts_recovered: 1, name: "Big" }
    expect(response).to have_http_status(:unauthorized)
  end

  it 'returns status code 401 when token is missing' do
    get '/ingredients', params: { base_hearts_recovered: 1, name: "Big" }
    expect(response).to have_http_status(:unauthorized)
  end

  it 'returns results when name matches Big' do
    get '/ingredients', params: { token: user.token, name: "Big" }
    expect(JSON.parse(response.body).size).to eq(2)
  end

  it 'returns results when base_hearts_recovered matches 5' do
    get '/ingredients', params: { token: user.token, base_hearts_recovered: 5 }
    expect(JSON.parse(response.body).size).to eq(1)
  end

end

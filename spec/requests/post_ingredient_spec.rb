require 'rails_helper'

describe "get all ingredients route", type: :request do

  before do
    post '/ingredients', params: { name: 'Berry Berries', base_hearts_recovered: 0 }
  end

  it 'returns the ingredient name' do
    expect(JSON.parse(response.body)['name']).to eq('Berry Berries')
  end

  it 'returns the ingredient base hearts recovered' do
    expect(JSON.parse(response.body)['base_hearts_recovered']).to eq('0.0')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end

require 'rails_helper'

describe "get all ingredients route", :type => :request do
  let!(:ingredients) { FactoryGirl.create_list(:ingredient, 20)}

  before { get '/ingredients'}

  it 'returns all ingredients' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

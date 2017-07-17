require 'rails_helper'

describe 'get universities', type: :request do
  let!(:universities) { FactoryGirl.create_list(:university, 20)}

  before { get '/universities' }

  it 'returns all universities' do
    expect(JSON.parse(response.body).size).to eq 20
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end
end

describe 'get exceptions', type: :request do
  let!(:universities) { FactoryGirl.create_list(:university, 20)}

  before { get '/universities/22' }

  it 'returns status code 404' do
    expect(response).to have_http_status :not_found
  end
end

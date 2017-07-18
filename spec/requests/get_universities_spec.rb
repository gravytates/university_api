require 'rails_helper'

describe 'get universities', type: :request do
  let!(:universities) { FactoryGirl.create_list(:university, 20)}

  before { get '/universities' }

  it 'returns all universities' do
    expect(JSON.parse(response.body).size).to eq 20
  end

  it 'returns all universities by name' do
    get '/universities?name=USC'
    output = JSON.parse(response.body).first
    expect(output.fetch("name")).to eq 'USC'
  end

  it 'returns all universities by description' do
    get '/universities?description=Amazing'
    output = JSON.parse(response.body).first
    expect(output.fetch("description")).to eq 'Amazing'
  end

  it 'returns all universities by population' do
    get '/universities?population=15000'
    output = JSON.parse(response.body).first
    expect(output.fetch("population")).to eq 15000
  end

  it 'returns all universities by mascot' do
    get '/universities?mascot=Trojan'
    output = JSON.parse(response.body).first
    expect(output.fetch("mascot")).to eq 'Trojan'
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

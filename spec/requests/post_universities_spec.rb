require 'rails_helper'
require 'jwt'
# hmac_secret = 'my$ecretK3y'

describe 'post universities', type: :request do
  university = FactoryGirl.build(:university)
  user = User.create(email: 'a@a.com', password: '111111', password_confirmation: '111111')


  before do
    token = JsonWebToken.encode({user_id: user.id})
    head "Authorization", "Bearer #{token}",
    post '/universities', params: {name: university.name, description: university.description, population: university.population, mascot: university.mascot }
  end

  it 'returns the university name' do
    expect(JSON.parse(response.body)['name']).to eq university.name
  end

  it 'returns the university description' do
    expect(JSON.parse(response.body)['description']).to eq university.description
  end

  it 'returns the university population' do
    expect(JSON.parse(response.body)['population']).to eq university.population
  end

  it 'returns the university mascot' do
    expect(JSON.parse(response.body)['mascot']).to eq university.mascot
  end
end

describe 'post exception handlers', type: :request do

  university = FactoryGirl.build(:university)

  before {
    post '/universities', params: {name: '', description: university.description, population: university.population, mascot: university.mascot }
  }

  it 'returns error code 422' do
    expect(response).to have_http_status :unprocessable_entity
  end

end

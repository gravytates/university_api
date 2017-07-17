require 'rails_helper'

describe 'post universities', type: :request do
  university = FactoryGirl.build(:university)

  before {
    post '/universities', params: {name: university.name, description: university.description, population: university.population, mascot: university.mascot }
  }

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

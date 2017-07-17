require 'rails_helper'

describe 'update a university', type: :request do
  university = FactoryGirl.build(:university)

  before {
    post '/universities', params: {name: university.name, description: university.description, population: university.population, mascot: university.mascot }
  }

  it 'updates name of university from the api database' do
    patch '/universities/1', params: { name: "new name" }
    expect(JSON.parse(response.body)['name']).to eq "new name"
  end
end

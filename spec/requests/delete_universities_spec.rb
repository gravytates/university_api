require 'rails_helper'


describe 'post universities', type: :request do
  before do
    FactoryGirl.reload
  end
  let!(:universities) { FactoryGirl.create_list(:university, 20)}

  before { post '/universities' }

  it 'deletes a university from the api database' do
    delete '/universities/1'
    get '/universities/1'
    expect(JSON.parse(response.body).first[1]).to eq "Couldn't find University with 'id'=1"
  end
end

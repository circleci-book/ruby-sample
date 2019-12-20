
require 'rails_helper'

RSpec.describe 'User', type: :request do
  it "renders index template" do
    get '/users'
    expect(response.body).to include('Listing Users')
  end
end

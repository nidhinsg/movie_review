require 'rails_helper'

describe 'Request: /api/v1/user_reviews.json', type: :request do

  let(:movie1) {Movie.create!(name: "Test Movie 1")}
  let(:user1) {User.create!(fullname: "Tester 1", email: "test1@test.com", password: "123456")}

  it 'It should post the exact review comment for the right movie' do
  	movie1
  	user1

    params = { user_id: user1.id, comments: 'Test Comment by User 1', movie_id: movie1.id }
    headers = { 'HTTP_AUTH_TOKEN' => user1.auth_token }

    post "/api/v1/user_reviews.json", params: params, headers: headers
    resp = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
    expect(resp["comment"]).to eq("Test Comment by User 1")
  end
end

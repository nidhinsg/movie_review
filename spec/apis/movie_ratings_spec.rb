require 'rails_helper'

describe 'Request: /api/v1/movies/:movie_id/movie_ratings.json', type: :request do

  let(:movie1) {Movie.create!(name: "Test Movie 1")}
  let(:user1) {User.create!(fullname: "Tester 1", email: "test1@test.com", password: "123456")}
  let(:user2) {User.create!(fullname: "Tester 2", email: "test2@test.com", password: "123456")}
  let(:user_review) {MovieRating.create!(user_id: user2.id, movie_id: movie1.id, ratings: "2")}

  it 'It should rate the movie exactly and return the expected average ratings' do
  	movie1
  	user1
    user_review

    params = { user_id: user1.id, rating: '4', movie_id: movie1.id }
    headers = { 'HTTP_AUTH_TOKEN' => user1.auth_token }

    post "/api/v1/movies/#{movie1.id}/movie_ratings.json", params: params,
                                                           headers: headers
    resp = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
    expect(resp["ratings"]).to eq(4)
    expect(resp["average_rating"]).to eq(3)
  end
end

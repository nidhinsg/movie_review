require 'rails_helper'

describe 'Request: /api/v1/movies.json', type: :request do

  let(:movie1) {Movie.create!(name: "Test Movie 1")}
  let(:movie2) {Movie.create!(name: "Test Movie 2")}
  let(:user) {User.create!(email: "test@test.com", password: "123456")}

  it 'Movie Index Api Should Return the expected movies' do
  	movie1
  	movie2

    headers = { 'HTTP_AUTH_TOKEN' => user.auth_token }

    get '/api/v1/movies.json', params: {},
                               headers: headers


    resp = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
    expect(resp.first["name"]).to eq("Test Movie 1")
    expect(resp.length).to eq(2)
  end
end

describe 'Request: /api/v1/movies/highest_avg_rated.json', type: :request do

	let(:movie1) {Movie.create!(name: "Test Movie 1")}
  let(:movie2) {Movie.create!(name: "Test Movie 2")}
  let(:movie3) {Movie.create!(name: "Test Movie 3")}
  let(:user1) {User.create!(fullname: "Tester 1", email: "test1@test.com", password: "123456")}
  let(:user2) {User.create!(fullname: "Tester 2", email: "test2@test.com", password: "123456")}
  let(:movie_ratings1) {MovieRating.create!(user_id: user1.id, movie_id: movie1.id, ratings: "3")}
  let(:movie_ratings2) {MovieRating.create!(user_id: user1.id, movie_id: movie2.id, ratings: "2")}
  let(:movie_ratings3) {MovieRating.create!(user_id: user2.id, movie_id: movie1.id, ratings: "4")}
  let(:movie_ratings4) {MovieRating.create!(user_id: user2.id, movie_id: movie3.id, ratings: "5")}

	it 'Highest Average Rated Movie must return the expected order of movies' do
  	movie1
  	movie2
  	movie3
  	user1
  	user2
  	movie_ratings1
  	movie_ratings2
  	movie_ratings3
  	movie_ratings4

    headers = { 'HTTP_AUTH_TOKEN' => user1.auth_token }
  	
  	get '/api/v1/movies/highest_avg_rated.json', params: {},
                                                headers: headers
  	resp = JSON.parse(response.body)
  	expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
    expect(resp.first["name"]).to eq("Test Movie 3")
  end
end

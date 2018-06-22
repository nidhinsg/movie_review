describe Api::V1::MoviesController do

	it 'should return all Movies' do
	    put api_v1_movies_path
	    result_json = JSON.parse(response.body)
	    p "------"
	    p result_json
	    p "-----"
	    assert_equal(message_on_deactivate_personnel, result_json)
	end

end
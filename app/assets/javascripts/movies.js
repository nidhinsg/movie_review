document.addEventListener("turbolinks:load", function() {
	var user_movie_rating = $(".movie-star-rating").attr("data-user-rating");

	$(".movie-star-rating").addRating({
		selectedRatings: user_movie_rating
	});

	$(".movie-star-rating").click(function() {
		var rating = $("#rating").val();
		var user_id = $(this).attr("data-user-id");
		var movie_id = $(this).attr("data-movie-id");
		var user_token = $(this).attr("data-auth-token");
		$.ajax({
			method: "POST",
			url: "/api/v1/movies/" + movie_id + "/movie_ratings",
			headers: {"auth_token": user_token},
			data: {
				rating: rating,
				user_id: user_id
			},
			success: function(response) {
				$("#avg_rating").html("Average Rating: " + response['average_rating'] + "/5");
			}
		});
	});

	$("#submit-user-review").click(function() {
		var user_id = $(this).attr("data-user-id");
		var user_token = $(this).attr("data-auth-token");
		var movie_id = $(this).attr("data-movie-id");
		var user_comment = $("#user-comment").val();
		$.ajax({
		  method: "POST",
		  url: "/api/v1/user_reviews.json",
		  data: { user_id: user_id, 
		  		movie_id: movie_id,
		  		comments: user_comment},
		  headers: {"auth_token": user_token},	
		  success: function(response) {
		  	location.reload();
		  	// $("#movie-review-box").append(
		  	// 	"<div class ='row'>" +
		  	// 		"<div class='col-md-2'>" +
		  	// 			"<div class='row'>" +
		  	// 				"<div class='col-md-6'>" +
		  	// 					"<div class='upvote review-vote' data-review-id='" + response["id"] +"'></div>" +
		  	// 					"<div class='downvote review-vote' data-review-id='" + response["id"] +"'></div>" +
		  	// 				"</div>" +
		  	// 				"<div class='col-md-6'>" +
		  	// 					"<div class='upvotes' data-vote='46'>46</div>" +
		  	// 				"</div>" +
		  	// 			"</div></div>" +
		  	// 		"<div class='col-md-8'> " + response["comment"] + " </div>" +
		  	// 		"<div class='col-md-2'> " + response["created_at"] + "</div>" + 
		  	// 	"</div>"
		  	// );
		  }
		});
	});


	$(".review-vote").click(function() {
		var vote_flag = 1;
		if ($(this).hasClass("downvote")) {
			vote_flag = -1;
		}
		var user_id = $(this).attr("data-user-id");
		var user_review_id = $(this).attr("data-review-id");
		var user_token = $(this).attr("data-auth-token");
		console.log(vote_flag);
		$.ajax({
			method: "POST",
			url: "/api/v1/review_votes.json",
			headers: {"auth_token": user_token},
			data: { user_id: user_id, 
		  		user_review_id: user_review_id,
		  		vote_flag: vote_flag
		  	},

			success: function(response) {
				$("#votes_id_" + user_review_id).html(response["review_vote_count"]);
			}
		});
	});

	$("#highest-rating").click(function() {
		var user_token = $(this).attr("data-auth-token");
		$.ajax({
			method: "GET",
			url: "/api/v1/movies/highest_avg_rated",
			headers: {"auth_token": user_token},
			success: function(response) {
				console.log(response);
			}
		});
	});
});

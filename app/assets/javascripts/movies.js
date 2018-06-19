document.addEventListener("turbolinks:load", function() {
	var average_movie_rating = $(".movie-star-rating").attr("data-avg-rating");

	$(".movie-star-rating").addRating({
		selectedRatings: average_movie_rating
	});

	$(".movie-star-rating").click(function() {
		var rating = $("#rating").val();
		var user_id = $(this).attr("data-user-id");
		var movie_id = $(this).attr("data-movie-id");
		$.ajax({
			method: "POST",
			url: "/api/v1/movies/" + movie_id + "/movie_ratings",
			data: {
				rating: rating,
				user_id: user_id
			},
			success: function(response) {
				$(".movie-star-rating").html("");
				$(".movie-star-rating").addRating({
					selectedRatings: response["average_rating"]
				});
			}
		});
	});

	$("#submit-user-review").click(function() {
		console.log("jaaaaaaaa");
		var user_id = $(this).attr("data-user-id");
		var movie_id = $(this).attr("data-movie-id");
		var user_comment = $("#user-comment").val();
		$.ajax({
		  method: "POST",
		  url: "/api/v1/user_reviews.json",
		  data: { user_id: user_id, 
		  		movie_id: movie_id,
		  		comments: user_comment},

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
			console.log('downvote');
		}
		var user_id = $(this).attr("data-user-id");
		var user_review_id = $(this).attr("data-review-id");
		$.ajax({
			method: "POST",
			url: "/api/v1/review_votes.json",
			data: { user_id: user_id, 
		  		user_review_id: user_review_id,
		  		vote_flag: vote_flag
		  	},

			success: function(response) {
				$("#votes_id_" + user_review_id).html(response["review_vote_count"]);
			}
		});
	});
});

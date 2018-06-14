$(document).ready(function() {
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
		  	var append_data = "escape_javascript(<%= render 'review_comments', review: " + response + " %>)"
		  	append_new_comment(append_data);
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
		 if ($(this).hasClass("upvote")) {  
		 	console.log('upvote');
		 } else {
		 	console.log('downvote');
		 }
	});





});

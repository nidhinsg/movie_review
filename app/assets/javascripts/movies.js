$(document).ready(function() {
	$("#submit-user-review").click(function() {
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
		  	console.log(response);
		  	$("#movie-review-box").append(
		  		"<div class ='row'>" +
		  			"<div class='col-md-2'> Up Vote / Down Vote </div>" +
		  			"<div class='col-md-8'> " + response["comment"] + " </div>" +
		  			"<div class='col-md-2'> " + response["created_at"] + "</div>" + 
		  		"</div>"
		  	);
		  }
		});
	});
});

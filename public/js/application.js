$(document).ready(function () {

	$("a#add-list").on("click", function(event){
		event.preventDefault();
		var url = $(this).attr("href")

		$.ajax({
			method: "get",
			url: url
		})

		.done( function(htmlForm){
			$(htmlForm).appendTo(".list-container")
		});
			
	});
  	
  	$(".list-container").on("submit", "#new-list-form", function(event){
		event.preventDefault();
		var method = $(this).attr("method");
		var url = $(this).attr("action");
		var data = $(this).serialize();

		$.ajax({
			method: method,
			url: url,
			data: data
		})

  		.done( function(response) {
			$(response).appendTo("#list-index");
		}); 
	});

});

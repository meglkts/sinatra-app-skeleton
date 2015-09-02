$(document).ready(function () {

// LIST INDEX PAGE
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
  			$("#new-list-container").remove();
			$(response).appendTo("#list-index");
		}); 
	});

// LIST SHOW PAGE - ADD TASK FUNCTION

  	$("a#add-task").on("click", function(event){
		event.preventDefault();
		var url = $(this).attr("href")

		$.ajax({
			method: "get",
			url: url
		})

		.done( function(htmlForm){
			$(htmlForm).appendTo(".list-show-container")
		});
			
	});
  	
  	$(".list-show-container").on("submit", "#new-task-form", function(event){
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
  			$("#new-task-container").remove();
			$(response).appendTo("#outstanding-tasks");
		}); 
	});


  	// LIST SHOW PAGE - DELETE TASK FUNCTION

 //  	$("#delete-task").on("submit", function(event){
	// 	event.preventDefault();
	// 	var method = $(this).attr("method");
	// 	var url = $(this).attr("action");

	// 	$.ajax({
	// 		method: method,
	// 		url: url
	// 	})

	// 	.done( function(){
	// 		$(this).remove(".list-show-container")
	// 	});
			
	// });

});

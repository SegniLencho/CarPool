/**
 * 
 */
index =0;
var initrow=0;
stop = false;
$(function(){
	"use strict";
	
	 $(window).scroll(function ()
        {
              if($(document).height() <= $(window).scrollTop() + $(window).height())
              {
					   loadmore();
              }
        });
	
	$(document).ajaxStart(function(){
		$('#loader').css('display','inline');
	});
	
	$(document).ajaxStop(function(){
		$('#loader').css('display','none');
	});
	loadUserPost();
	intervalCheck();
});

function loadUserPost(){
	"use strict";	
    	$.ajax({
			'url':'http://localhost:8080/CarPoolWebService/Services/PostService/posts?type=2',
			'success':givingSuccess,
			'error':ajaxFailure
	 	   });
	$.ajax(
		   {
			'url':'http://localhost:8080/CarPoolWebService/Services/PostService/count',
			 'success': function(jsonData){
					  initrow = jsonData;
//					   alert(initrow);
						}
		});
}

function loadmore(){
    "use strict";
	alert(stop);
    if(stop!==true){
       	$.ajax({
			'url':'http://localhost:8080/CarPoolWebService/Services/PostService/moreoffer?type=2&index='+index+'',
			'success':givingSuccess,
			'error':ajaxFailure
	 	   }); 
    }
}

function givingSuccess(jsonData){
	"use strict";
	/*alert(jsonData.length);*/
    if(jsonData.length!==0){
		stop =false;
         if(index==0){
                index = 5;
            }
			else{
				index = index+jsonData.length;
			}
	let allpost = jsonData;
	for(let post of allpost){
		let user = post.user;
		let allcomments = post.comment;
        let allikes = post.like;
		$('.givingpost .owner').append('<h2>Post</h2>');
		$('.givingpost .owner').append('<p>'+user.firstName+'</p>');
		$('.givingpost .owner').append('<p>'+user.email+'</p>');
		$('.givingpost .owner').append('<p>'+post.postText+'</p>');
        $('.givingpost .owner').append('<input name="like" id="like" type="submit" value="'+allikes.length+' likes">');
        $('.givingpost .owner').append('<input name="comment" id="comment" type="submit" value="'+allcomments.length+' comment">');
		$('.givingpost.owner').append('<br>');
		$('.givingpost.owner').append('<h2>Comments</h2>');
		$('.givingpost.owner').append('<br>');
		
		for(let comment of allcomments){
			let user = comment.user;
			if(user!==null){
				$('.givingpost .comments').append('<p>'+user.firstName+'</p>');
				$('.givingpost .comments').append('<p>'+user.email+'</p>');
				$('.givingpost .comments').append('<p>'+comment.comment+'</p>');
				$('.givingpost .comments').append('<br>');
			}
		}
	}
  }
	else{
		stop = true;
	}
}

function ajaxFailure(xhr, status, exception) {
	    "use strict";
		alert('failure to fetch data');
  		console.log(xhr, status, exception);
}
function notify(currentrow){
 
let diff= currentrow-initrow;
  if(diff>0){
$("#eg").css("background-color","red").css("position","relative")
   .css("top","-20px").css("left","-5px").text(diff);
  }
  // $("<span>").addClass("badge badge-notify").css("background-color","red").css("position","relative")
  // .css("top","-20px").css("left","-5px").text("3").appendTo($("#not"));
  //alert(3);
  // $("<p>").text("3dfadaadfaf").appendTo($("#not"));
}

  function intervalCheck(){
     clearfunc= setInterval(checkRowCount,2000);
  }

function  checkRowCount(){
     
       $.ajax({ url:'http://localhost:8080/CarPoolWebService/Services/PostService/count',
                type:'get'
               
       }
       ).done( function (data){
         
		   console.log(data);
                notify(data);
       }).fail();
       
       
}
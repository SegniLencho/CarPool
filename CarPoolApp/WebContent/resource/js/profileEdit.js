

$(function(){
 $("input[type= text]").prop('disabled',true);
 $("button[type= submit]").prop('disabled',true);
     $("#fnedit").click(enable);
    
         
});


function enable (){
$("input[type= text]").prop('disabled',false);
$("button[type= submit]").prop('disabled',false);
}




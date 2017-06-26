$( function(){
    $("button[type=submit]").on('click',checkAGe);
}
);

function checkAGe(){
  let currentYear= new Date().getFullYear();
  console.log($("#bdate").val());
  console.log(currentYear);
if((currentYear-$("#bdate").val())< 18){
  $("<p>").css("color","red").text("Age must be above 18").appendTo($("#byear"));
  return false;
}

}
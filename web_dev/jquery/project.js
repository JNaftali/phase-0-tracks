$(document).ready(function() {
  console.log("Doc Ready");
  $('div').height("200px");
  $('div').width("200px");
  $('div').css("background-color", "blue");
  $(document).dblclick(function() {
    $('div').toggle($("select").val());
  });
});
$(function(){
  addFormEventHandler();
});

function addFormEventHandler(){
  $('form.periods_index').on('ajax:complete', function(e, request, status){
    var response = request.responseJSON;
    $('ul#all_costumes').prepend("<li><a href='/periods/" + response.name + "'>" + response.time_period + "</a></li>");
    $('#period').val("");

  });

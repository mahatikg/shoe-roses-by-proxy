$(function(){
  addFormEventHandler();
});

function addFormEventHandler(){
  $('form.costumes_index').on('ajax:complete', function(e, request, status){
    var response = request.responseJSON;
    $('ul#all_costumes').prepend("<li><a href='/costumes/" + response.name + "'>" + response.period + "</a></li>");
    $('#costume').val("");

  });

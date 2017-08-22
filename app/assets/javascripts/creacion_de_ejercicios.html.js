$(document).ready(function(){
  console.log("prueb");
    $("#btn_inputs").click(function(){
      //create an element
      var $element = $('<div class="draggableResizable" />');

      //append it to the DOM
      $("#work_area").append($element);

      //make it "draggable" and "resizable"
      $element.draggable().resizable();
    });


});

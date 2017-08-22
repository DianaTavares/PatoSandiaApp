$(document).on('click','#btn_inputs', function() {

  console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
    // $("#btn_inputs").click(function(){
      //create an element
      var $element = $('<div class="draggableResizable" />');

      //append it to the DOM
      $("#work_area").append($element);

      //make it "draggable" and "resizable"
      $element.draggable().resizable();
    // });
});

var $inputN = 0

$(document).on('click','#btn_inputs', function() {
      $inputN++
      console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
      // sumar uno al inputN
      console.log($inputN);
    // $("#btn_inputs").click(function(){
      //create an element
      var $element = $('<div class="draggableResizable"/>').append('<label for="exercise_name"><input id=exercise_name type= text name="exercise[name'+$inputN+']" />este es un input MotherFuck></label>');

      //append it to the DOM
      $("#work_area").append($element);

      //make it "draggable" and "resizable"
      $element.draggable({
        containment: '#work_area',
      }).resizable();
    // });
});

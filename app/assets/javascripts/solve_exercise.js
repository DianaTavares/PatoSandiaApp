// variable para agregar a cada input dragable creado
var $inputN = 0

$(document).on('click','#btn_inputs', function() {
  // sumar uno al inputN
      $inputN++
      console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
      // asignar al un div draggableResizable y anexarle un label  y name para que el botón "terminar trabajo" envíe los datos al params
      var $element = $('<div class="draggableResizable"/>').append('<label for="exercise_input"><input id=exercise_input type= text name="exercise[input'+$inputN+']" />este es un input MotherFuck></label>');

      //append it to the DOM
      $("#work_area").append($element);

      //make it "draggable" and "resizable"
      $element.draggable({
        containment: '#work_area',
      }).resizable();
    // });
});

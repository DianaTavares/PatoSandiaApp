// variable para agregar a cada input dragable creado
var $inputN = 0
var $array = new Array
$(document).on('click','#btn_inputs', function() {
  // sumar uno al inputN
      $inputN++
      // console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
      // asignar al un div draggableResizable y anexarle un label  y name para que el botón "terminar trabajo" envíe los datos al params
      var $element = $('<div class="draggableResizable"/>').append('<label for="exercise_input"><input id="input-'+$inputN+'" type= text name="exercise[input'+$inputN+']" />este es un input arrastralo></label>');
      // console.log($element);
      $array.push($element);
      //append it to the DOM
      $("#work_area").append($element);

      //make it "draggable" and "resizable"
      $element.draggable({
        // manterlo limitado al área de trabajo
        containment: '#work_area',
      }).resizable();
    // });
});

$(document).on('click','#btn-terminar-ejercicio', function(event) {

  for (var i = 0; i < $array.length; i++) {

    console.log($array[i].offset());
  }
  // console.log($("#input-1").offset());
  // console.log($("#input-2").offset());
  // console.log($("#input-3").offset());
  // .position();
  // $.each($(".draggableResizable"), function( index, value ) {
  //   alert(index + ": " + value);
  // });
  alert("alerta");
  // console.log($element.position());
  // event.preventDefault
  // alert("click en #btn-terminar-ejercicio");

});

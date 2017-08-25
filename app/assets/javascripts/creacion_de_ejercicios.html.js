// variable para agregar a cada input dragable creado
var $inputN = 0
var $array = new Array
$(document).on('click','#btn_inputs', function() {
  // sumar uno al inputN
      $inputN++
      // console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
      // asignar al un div draggableResizable y anexarle un label  y name para que el botón "terminar trabajo" envíe los datos al params
      var $element = $('<div class="draggableResizable draggableinput"/>').append('<label for="exercise_input"><input id="input-'+$inputN+'" type= text name="exercise[input'+$inputN+']" />input, muevelo</label>');
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
    //funcion para que el input se ajuste al contenido
    function resizeInput() {
      console.log("entre al tamaño del input");
      var valueLength = $(this).prop('value').length;
      console.log(valueLength);
      // Para que no arroje error si el input se vacía
      if (valueLength > 0) {

      $(this).prop('size', valueLength);
      }
    }

    $('#input-'+$inputN+'').on('keyup', resizeInput).each(resizeInput);
});

var $textN = 0
$(document).on('click','#btn_text', function() {
  // sumar uno al inputN
      $textN++
      // console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
      // asignar al un div draggableResizable y anexarle un label  y name para que el botón "terminar trabajo" envíe los datos al params
      var $element = $('<div class="draggableResizable draggabletext" style="position: absolute; left: 81px; top: 205px" />').append('<label for="exercise_input"><input id="text-'+$textN+'" type= text name="exercise[text'+$textN+']" />texto, muevelo</label>');
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
    //esta función se agregó para el el tamaño del input se ajuste al texto
    function resizeInput() {
      console.log("entre al tamaño del input");
      var valueLength = $(this).prop('value').length;
      console.log(valueLength);
      // Para que no arroje error si el input se vacía
      if (valueLength > 0) {

      $(this).prop('size', valueLength);
      }
    }

    $('#text-'+$textN+'').on('keyup', resizeInput).each(resizeInput);

});


$(document).on('click','#btn-terminar-ejercicio', function(event) {
  // desde el 0 hasta el numero de elementos creados en el área de trabajo y empujados
  for (var positions = 0; positions < $array.length; positions++) {
    // obtner las cordenadas top y left de cada elemento creado
    var $top = $array[positions].offset().top;
    var $left = $array[positions].offset().left;
    console.log($top);
    console.log($left);
    // se crea una variable para agregar al nombre el key de cada input, esto es, input1, input2, etc
    // "positions"=>{"input1-top"=>"377", "input1-left"=>"18"},
    var position = positions + 1
    // anexar  un input de texto al area de trabajo donde el value = cordenadas del elemento, uno para top y otro para left
    $("#work_area").append('<label for="exercise_input"><input class="input-hide" type=text value='+ $top +' name="positions[input'+ position +'_top]" /></label>');
    $("#work_area").append('<label for="exercise_input"><input class="input-hide" type=text value='+ $left +' name="positions[input'+ position +'_left]" /></label>');
  }

        // var person = prompt("Please enter your name");
        //
        // if (person == null || person == "") {
        //     txt = "User cancelled the prompt.";
        // } else {
        //     txt = "Hello " + person + "! How are you today?";
        // }

        // alert("fin")
});

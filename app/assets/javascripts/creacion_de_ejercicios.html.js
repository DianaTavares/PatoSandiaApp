// variable para agregar a cada input dragable creado
var $inputN = 0
var $array = new Array
var $textN = 0
$(document).ready(function() {
  $(document).on('click','#btn_delete', function() {
    $inputN = 0
    $array = new Array
    $textN = 0
    // alert("delet")
  });
  $(document).on('click','#btn_inputs', function() {
    console.log($inputN);
    // sumar uno al inputN
    $inputN++
    console.log($inputN);
    // console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
    // asignar al un div draggableResizable y anexarle un label  y name para que el botón "terminar trabajo" envíe los datos al params
    var $element = $('<div class="draggableResizable"/>').append('<label for="exercise_input"><input id="input-'+$inputN+'" type= text name="exercise[input'+$inputN+']" />este es un input arrastralo</label>');
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
  $(document).on('click','#btn_text', function() {
    console.log($textN);
    // sumar uno al inputN
    $textN++
    console.log($textN);
    // console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
    // asignar al un div draggableResizable y anexarle un label  y name para que el botón "terminar trabajo" envíe los datos al params
    var $element = $('<div class="draggableResizable"/>').append('<label for="exercise_input"><input id="text-'+$textN+'" type= text name="exercise[text'+$textN+']" />este es un texto, arrastralo</label>');
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

    // alert("fin")
  });


});

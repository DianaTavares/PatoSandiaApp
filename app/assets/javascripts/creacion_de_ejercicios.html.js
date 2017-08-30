// variable para agregar a cada input dragable creado
var $inputN = 0
var $array = new Array
var $arrayEdit = new Array
var $textN = 0
var $arrayN = -1
$(document).ready(function() {
  // event handler al apretar botono "recuperar ubicaciones "
  $(document).on('click','#btn_delete', function() {
    $inputN = 0
    $array = new Array
    $textN = 0
    $arrayN = -1
    // alert("delet")
  });
  $(document).on('click','#btn_inputs', function() {
    //console.log($inputN);
    // sumar uno al inputN
    $inputN++
    $arrayN++
    //console.log($inputN);
    // console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
    // asignar al un div draggableResizable y anexarle un label  y name para que el botón "terminar trabajo" envíe los datos al params
    var $element = $('<div id="'+$arrayN+'" class="draggableResizable draggableinput" style="position: absolute"/>').append('<label for="exercise_input" class="new"><input id="input-'+$inputN+'" type= text name="exercise[input'+$inputN+']"/>Input <a class="close" href="#">x</a> </label>');
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
      var valueLength = $(this).prop('value').length;
      //console.log(valueLength);
      // Para que no arroje error si el input se vacía
      if (valueLength > 0) {

      $(this).prop('size', valueLength);
      }
    }

    $('#input-'+$inputN+'').on('keyup', resizeInput).each(resizeInput);


      //funcion para eliminar textos del área de trabajo
      $("#work_area").on("click",".close",function(event){
          event.preventDefault();
          //guardamos en deleted el elemento a eliminar con sus parent correspodientes (label y div)
          var deleted = $(this).parent().parent();
          // variable para distingruir si el elemento es un input, un text o un elemento nuevo
          var arrayelement = $(this).parent().attr("class");
          //eliminar el elmento del array correspondiente
          if (arrayelement == "text"){
            $arrayText[deleted.attr("id")] = 0;
            console.log($arrayText);
          }else if (arrayelement == "input") {
            $arrayInput[deleted.attr("id")] = 0;
            console.log($arrayInput);
          }else if (arrayelement = "new") {
            $array[deleted.attr("id")] = 0;
            console.log($array);
          }
          //eliminar el elemento del DOM
          deleted.remove();
        });




});

var $textN = 0
$(document).on('click','#btn_text', function() {
  // sumar uno al inputN
      $textN++
      $arrayN++
      // console.log("en creacion_de_ejercicios.html.js se ha dado click al boton con id #btn_inputs");
      // asignar al un div draggableResizable y anexarle un label  y name para que el botón "terminar trabajo" envíe los datos al params
      var $element = $('<div id="'+$arrayN+'" class="draggableResizable draggabletext" style="position: absolute" />').append('<label for="exercise_input" class="new"><input id="text-'+$textN+'" type= text name="exercise[text'+$textN+']" />Text <a class="close" href="#">x</a> </label>');
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
      var valueLength = $(this).prop('value').length;
      //console.log(valueLength);
      // Para que no arroje error si el input se vacía
      if (valueLength > 0) {

      $(this).prop('size', valueLength);
      }
    }

    //funcion para eliminar textos del área de trabajo
    $("#work_area").on("click",".close",function(event){
        event.preventDefault();
        var deleted = $(this).parent().parent().parent();
        deleted.remove();
        $array[deleted.attr("id")] = 0;
      });


    $('#text-'+$textN+'').on('keyup', resizeInput).each(resizeInput);

});

  $(document).on('click','#btn-terminar-ejercicio', function(event) {
    //elimina todos los ceros (elementos borrados) de $array
    $array = jQuery.grep($array, function(value) {
      return value != 0;
    });
    // obtner las posicion left y top del area de trabajo de nuevo ejercicio
    var $wat = $("#work_area").offset().top;
    var $wal =$("#work_area").offset().left;
    console.log($wat);
    console.log($wal);
    // para elementos NUEVOS a ingresar a la BD
    // desde el 0 hasta el numero de elementos creados en el área de trabajo y empujados
    for (var positions = 0; positions < $array.length; positions++) {
      // obtner las cordenadas top y left de cada elemento creado
      var $top = $array[positions].offset().top;
      var $left = $array[positions].offset().left;

      // sustraer el top y el left del elemento
      $top = $top-$wat
      $left = $left-$wal

      // console.log($array[positions]);
      // console.log("top");
      // console.log($top);
      // console.log("left");
      // console.log($left);

      // se crea una variable para agregar al nombre el key de cada input, esto es, input1, input2, etc
      // "positions"=>{"input1-top"=>"377", "input1-left"=>"18"},
      var position = positions + 1
      // anexar  un input de texto al area de trabajo donde el value = cordenadas del elemento, uno para top y otro para left
      $("#work_area").append('<label for="exercise_input"><input class="input-hide" type=text value='+ $top +' name="positions[input'+ position +'_top]" /></label>');
      $("#work_area").append('<label for="exercise_input"><input class="input-hide" type=text value='+ $left +' name="positions[input'+ position +'_left]" /></label>');
    }

// // para elementos inputs ya existentes en la BD
//     for (var positions = 0; positions < $arrayEdit.length; positions++) {
//       // obtner las cordenadas top y left de cada elemento creado
//       var $topEdit = $arrayEdit[positions].offset().top;
//       var $leftEdit = $arrayEdit[positions].offset().left;
//       // sustraer el top y el left del elemento
//       $top = $top-$wat
//       $left = $left-$wal
//       // se crea una variable para agregar al nombre el key de cada input, esto es, input1, input2, etc
//       // "positions"=>{"input1-top"=>"377", "input1-left"=>"18"},
//       var position = positions + 1
//       // anexar  un input de texto al area de trabajo donde el value = cordenadas del elemento, uno para top y otro para left
//       $("#work_area").append('<label for="exercise_input"><input class="input-hide" type=text value='+ $topEdit +' name="positions_ed[input_edit_'+ position +'_top]" /></label>');
//       $("#work_area").append('<label for="exercise_input"><input class="input-hide" type=text value='+ $leftEdit +' name="positions_ed[input_edit_'+ position +'_left]" /></label>');
//     }
    // alert("fin")
  });


});

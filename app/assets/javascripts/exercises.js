$( document ).ready(function() {
    $('.makeMeDraggable2').draggable( {
      containment: '#work_area',
      cursor: 'move',
      snap: '#work_area'
    } );
});

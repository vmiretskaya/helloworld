$(document).on('ready page:load', function(){
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
     $('.rated').raty({ path: '/assets', 
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });

// zoom in on the product show images
//$(".img-zoom").elevateZoom();

//add and draw color for product 

function drawCircle(width,height,canvasSize,element){
     element.width = canvasSize;
     element.height = canvasSize;
     var context = element.getContext('2d');  
     context.fillStyle = '#'+element.id;
     context.beginPath();
     context.arc(width/2,height/2,width/2,0,Math.PI*2,true);
     context.closePath();
     context.fill();   
}

function drawAllCircles(){
    $("#colorlist").children("canvas").each(function(indx, element){
     color_id = $(this).attr('data-color');
     val_col_id = $("#color_id").val();
     if(color_id!=val_col_id)
        drawCircle(18,18,21,element);
     else
        drawCircle(20,20,21,element);
    });
}
drawAllCircles();

$("#colorlist").children("canvas").on('click', function(){
    var curCanvas = $(this).closest('canvas').context;
     var curCanvas = $(this).closest('canvas').context;
     /////////////////////
    color_id = $(this).attr('data-color');
    console.log($(this));
    $("#color_id").val(color_id);
    ////////////////////
    drawAllCircles();
    });


$("#colorlist").children("canvas").hover(function(){
    var curCanvas = $(this).closest('canvas').context;
    drawCircle(20,20,21,curCanvas);

}, 
                                         function(){
   var curCanvas = $(this).closest('canvas').context;
     drawAllCircles();

});

});

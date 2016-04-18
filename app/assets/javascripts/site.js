$(document).on('ready page:load', function(){
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
     $('.rated').raty({ path: '/assets', 
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });

// zoom in on the product show images
    $(".img-zoom").elevateZoom();

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

$("#colorlist").children("canvas").each(function(indx, element){
     drawCircle(18,18,21,element);
     console.log("ddddd");
    });

$("#colorlist").children("canvas").hover(function(){
    var curCanvas = $(this).closest('canvas').context;
    drawCircle(20,20,21,curCanvas);

}, 
                                         function(){
   var curCanvas = $(this).closest('canvas').context;
    drawCircle(18,18,21,curCanvas);

});

});

/**
 * Created with JetBrains PhpStorm.
 * User: LandOfcoder
 * Date: 1/3/14
 * Time: 10:14 AM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function() {
  $("#block_content input,textarea").focus(function(){
    $(this).css("background-color","#D3D3D3");
  });
  $("#block_content input,textarea").blur(function(){
    $(this).css("background-color","#ffffff");
  });

  $("#media").change(function(){
    //$("#front_loader").html('aaaaaaaaaa');
    $("#front_loader").html('<img src="../img/front_loader.jpg" width="150" height="100">');
  });

  //$("#media_link").mouseenter(function(){
  //$('#show_link').text('Just enter Youtube and Vimeo link').css("color","red").slideToggle();
  //});

});

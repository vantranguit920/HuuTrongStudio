$(window).load(function() {
    $('.flexslider').flexslider({
        animation: "slide",
        animationLoop: false,
        itemWidth: 270,
        itemMargin: 30
    });
});
$(function(){
  
   
   $('#send_contact').click(function(){
       
       var dataString = {};
       dataString["fullname"] = $('#inputFullName').val();
       dataString["email"] = $('#inputEmail').val();
       dataString["phone"] = $('#inputPhone').val();
       dataString["content"] = $('#inputMessage').val();
       dataString["verifyCode"] = $('#inputSercurityCode').val();
       
       $.ajax({
            type: "POST",
            url: "/home/contact",
            data: {contact: JSON.stringify(dataString), dataType: 'json'},
            success: function(response) {
                response = jQuery.parseJSON(response);
                if(response.status == 200){
                    $('#contact_form').fadeOut(1000);
                    $('#contact_form').html('<p>'+response.messages+'</p>');
                    $('#contact_form').fadeIn(1000);
                }
                else{
                    alert(response.messages);
                }
                
            }
       });
       return false;
   });
   
});


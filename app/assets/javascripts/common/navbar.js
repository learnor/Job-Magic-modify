$(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) {
            $('#navbar').removeClass("navbar-static-top navbar-trans-black").addClass("navbar-fixed-top navbar-trans-white").fadeIn(500);
        } else if ($(this).scrollTop() < 200) {
            $('#navbar').removeClass("navbar-fixed-top navbar-trans-white").addClass("navbar-static-top navbar-trans-black").fadeIn(500);
        } else {
            $('#navbar').fadeOut(500);
        }
    });
});

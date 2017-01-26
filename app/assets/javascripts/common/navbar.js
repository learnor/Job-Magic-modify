$(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) {
            $('#navbar').removeClass("navbar-static-top").addClass("navbar-fixed-top").fadeIn(500);
        } else if ($(this).scrollTop() < 200) {
            $('#navbar').removeClass("navbar-fixed-top").addClass("navbar-static-top").fadeIn(500);
        } else {
            $('#navbar').fadeOut(500);
        }
    });
});

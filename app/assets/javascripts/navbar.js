$(document).on("page:change", function() {
  menuButton();
});

var menuButton = function() {
  $(".menu-button").on("click", function(e) {
    $(".site-wrapper").toggleClass("show-menu");
  });
};

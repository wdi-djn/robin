$(document).on("page:change", function() {
  menuButton();
});

var menuButton = function() {
  $(".menu-button").on("click", function(e) {
    $(".menu").slideToggle(200, "swing");
  });
};

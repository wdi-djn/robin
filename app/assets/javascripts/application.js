// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .


$(document).on("page:change", function() {
  animateForm();
  // checkActive();
});

var animateForm = function() {
  $("input").one("keypress", function() {
    var label = $(this).closest("div").find("label");
    label.addClass("active");
  });

  $("textarea").one("keypress", function() {
    var label = $(this).closest("div").find("label");
    label.addClass("active");
  });
};

var checkActive = function() {
   $("input").each(function(i) {
    if (this.type == "text" || "email" || "date") {   
      if (this.value !== "") {
        var label = $(this).closest("div").find("label");
        label.addClass("active");
      }
    }
  });
};



$(function(){ $(document).foundation(); });

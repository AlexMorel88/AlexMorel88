//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(function(){

  $(".tab").on("click", function(e){
    $(".tab").removeClass('active');
    $(this).addClass('active');
    var toshow = $(this).data("target");
    $(".tab-content").addClass('hidden');
    $(toshow).removeClass('hidden');

    // $(".tab").hide();
    // $(toshow).show();

    // Change active tab

    // Hide all tab-content (use class="hidden")

    // Show target tab-content (use class="hidden")
  });

});

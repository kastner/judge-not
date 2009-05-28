// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function show_then_fade(message, element) {
  if (!element) { element = "#message-center"; }
  $("<p>" + message + "</p>").appendTo(element).fadeTo(2000, 1).fadeOut('slow');
}

$(function() {
  jQuery.ajaxSetup({ 
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} 
  });
    
  $("#new_candidate input[type='text']:first").focus();
  $("#new_candidate").submit(function() {
    var sub_btn = $("input[type='submit']", $(this));
    var old_text = sub_btn.val();
    sub_btn.val("Adding...").attr("disabled", true);
    $.post($(this).attr("action"), $(this).serialize(), function() { 
      sub_btn.val(old_text).removeAttr("disabled"); 
    }, 'script');
    return false;
  });  
  
  $("#order-candidates").sortable({
    opacity: 0.8,
    axis: "y",
    cursor: "move",
  });
  
  $("#submit-candidate-votes").click(function() {
    $this = $(this);
    var old_text = $this.html();
    $this.html("Updating...");
    $.post($this.attr("title"), $("#order-candidates").sortable("serialize") + "&authenticity_token=" + token, function() {
      $this.html(old_text);
    }, "script");
  });
});

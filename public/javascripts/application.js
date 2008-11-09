// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
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
  
  $("#order-candidates").sortable();
});

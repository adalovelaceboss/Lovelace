// $(document).foundation()
// $(document).ready(function() {
//   $(document).foundation();
// });


$(document).on('turbolinks:load', function() {
  $(function(){
    $(document).foundation();
    $(window).trigger('load.zf.sticky'); 
   });
});

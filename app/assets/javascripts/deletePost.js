$(document).ready(function() {
  $("body").on("click", ".delete_btn", function() {
    e.preventDefault();
    var link = $(this);
    console.log(this);
    $.ajax(link.attr("href"), {
      method: "DELETE"
    }).done(function(data) {
      console.log("done");
      console.log(data);
    });
  })
});
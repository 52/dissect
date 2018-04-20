//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require html5sortable
//= require cocoon
//= require turbolinks

// Using html5sortable library
// More at: https://github.com/lukasoppermann/html5sortable/
document.addEventListener("turbolinks:load", function(){
  sortable(".sortable")[0].addEventListener("sortupdate", function(){

    var order = [];

    $(".sortable .portfolio-item").each(function(){
      order.push(this.id);
    });

    $.ajax({
      url:  $(".sortable").data("sort-url"),
      type: "PATCH",
      data: {order: order}
    });

  });
});

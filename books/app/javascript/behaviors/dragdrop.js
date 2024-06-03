JPX.Behaviors.dragdrop = function () {
$("th:not(:first-child)").draggable({
  axis: "x",
  containment: "parent",
  helper: "clone",
  start: function (e, ui) {
    ui.helper.addClass("select");
  },
  stop: function (e, ui) {
    ui.helper.removeClass("select");
  },
});

$("th").droppable({
  drop: function (event, ui) {
    var $dragElem = ui.draggable;
    var $dropElem = $(this);
    var dragIndex = $dragElem.index();
    var dropIndex = $dropElem.index();
    $("tr").each(function () {
      var $dragTd = $(this).find("td").eq(dragIndex);
      var $dropTd = $(this).find("td").eq(dropIndex);
      var dragText = $dragTd.text();
      var dropText = $dropTd.text();
      $dragTd.text(dropText);
      $dropTd.text(dragText);
    });
    // Update the text of the dropped th element
    var dragText = $dragElem.text();
    var dropText = $dropElem.text();
    $dragElem.text(dropText);
    $dropElem.text(dragText);
  },
});
};

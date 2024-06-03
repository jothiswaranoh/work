// document.addEventListener("DOMContentLoaded", function () {
//   var sortableTable = document.getElementById("sortable-table");
//   Sortable.create(sortableTable, {
//     animation: 150,
//     handle: "th",
//     onEnd: function (evt) {
//       var itemIds = Array.from(sortableTable.getElementsByTagName("tr")).map(
//         (tr) => tr.dataset.itemId
//       );
//       Rails.ajax({
//         url: "/items/update_order",
//         type: "POST",
//         data: "item_ids=" + itemIds.join("&"),
//         success: function (response) {
//           console.log("Order updated successfully");
//         },
//         error: function (xhr, status, error) {
//           console.error("Error updating order:", error);
//         },
//       });
//     },
//   });
// });
INIT.Behaviors.drag_drop = function () {
  console.log("drag_drop");
};

JPX.Behaviors.load_data_select = function () {
  let $this = $(this);

debugger
  $this.select2({
    placeholder: $this.data("placeholder"),
    allowClear: true,
    tokenSeparators: [","],
  });

  var dummyData = {
    names: [
      { id: 1, text: "Option 1" },
      { id: 2, text: "Option 2" },
      { id: 3, text: "Option 3" },
    ],
  };

  // Add options from dummy data
  $.each(dummyData.names, function (index, item) {
    if (
      !$this.find('option[value="' + `${item.text}:${item.id}` + '"]').length
    ) {
      $this.append(
        $("<option>", {
          value: `${item.text}:${item.id}`,
          text: item.text,
        })
      );
    }
  });

  // Trigger the change event after dynamically adding options
  $this.trigger("change");
  // $.ajax({
  //   url: url,
  //   type: "GET",
  //   dataType: "json",
  //   data: {
  //     name: $this.attr("name"),
  //   },
  //   success: function (data) {
  //     $.each(data.names, function (index, item) {
  //       if (
  //         !$this.find('option[value="' + `${item.text}:${item.id}` + '"]')
  //           .length
  //       ) {
  //         $this.append(
  //           $("<option>", {
  //             value: `${item.text}:${item.id}`,
  //             text: item.text,
  //           })
  //         );
  //       }
  //     });
  //   },
  //   error: function (error) {
  //     console.error("AJAX call failed:", error);
  //   },
  // });
  // $this.trigger("change");

  // var defaultValues = $(this).data("default-values");
  // if (defaultValues && defaultValues.length > 0) {
  //   defaultValues.forEach(function (value) {
  //     var text = value.split(":")[0];
  //     var option = new Option(text, value, true, true);
  //     $this.append(option).trigger("change");
  //   });
  // }
};

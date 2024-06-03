var JPX = {
  applyBehaviors: function (scope) {
    $("[data-behavior]", scope)
      .addBack("[data-behavior]")
      .each(function () {
        var $el = $(this);
        var behaviorsToApply = $el.attr("data-behavior").split(" ");
        $.each(behaviorsToApply, function (i, behaviorName) {
          if (!JPX.Behaviors[behaviorName]) {
            throw behaviorName + " does not exist in JPX.Behaviors";
          }
          JPX.Behaviors[behaviorName].apply($el);
        });
      });
  },
  reload: function () {
    window.location.reload();
  },
  redirect: function (location) {
    window.location.replace(location);
  },
  block_ui: function ($this) {
    $this.block({
      message: '<img src="/images/ajax-loader.gif">',
      css: {
        backgroundColor: "transparent",
        border: "none",
        opacity: 1,
        justifyContent: "center",
      },
      overlayCSS: {
        backgroundColor: "#fff",
        width: "100%",
      },
    });
  },
  unblock_ui: function ($this) {
    $this.unblock();
  },
  Behaviors: {},
};

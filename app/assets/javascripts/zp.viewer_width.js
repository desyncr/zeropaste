(function($) {
  window.zp.viewer_width = {
    links: function() { return $("#paste-resize ul li a") },
    current: "auto",
    resize: function(width) {
      var
        paste = $("#paste"),
        title = $("#paste-resize .btn")
      title.text(title.data("base").replace(":size:", width))
      this.current = width
      if (width == "auto") {
        paste.css("width", "")
      } else {
        paste.css("width", width)
      }
      zp.hash_magic.set_hash()
    },
    do_switch: function(e) {
      this.resize($(e.target).text())
    },
    init: function() {
      this.links().click($.proxy(this.do_switch, this))
    }
  }
})(jQuery)

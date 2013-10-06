//= require config/marked
//= require config/prettify
(function($) {
  window.zp.formatter = {
    raw: function() { return $("#pl pre").text() },
    links: function() { return $("#paste-mode a") },
    current: function() { return this.links().filter(".active").attr("href").slice(1) },
    markdown: function() {
      var area = $("#md div")
      area.html(marked(this.raw()))
      area.find("pre").addClass("prettyprint")
      area.find("a").prop("rel", "nofollow")
    },
    highlight: function() {
      $("#hl pre").text(this.raw())
      prettyPrint()
    },
    init: function() {
      this.markdown()
      this.highlight()
    }
  }
})(jQuery)

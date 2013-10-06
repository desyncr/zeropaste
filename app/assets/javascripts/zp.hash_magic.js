//= require zp.formatter
//= require zp.viewer_width
(function($) {
  window.zp.hash_magic = {
    load_hash: function() {
      var hash_array = window.location.hash.slice(2).split(".")
      format = hash_array[0]
      width = hash_array[1]
      if (format !== undefined) {
        zp.formatter.links().filter("[href=#" + format + "]").click()
      }
      if (width !== undefined) {
        zp.viewer_width.resize(width)
      }
    },
    set_hash: function(e) {
      if (typeof e !== "undefined") {
        if (zp.formatter.links().filter(e.target).length === 0 &&
            zp.viewer_width.links().filter(e.target).length === 0) { return }
        else e.preventDefault()
      }
      var
        format = zp.formatter.current(),
        width = zp.viewer_width.current,
        hash = "#!"
      hash += format
      if (width !== "auto") { hash += "." + width }
      if (hash === "#!pl") { hash = " " }
      history.replaceState(null, "", hash)
    },
    init: function() {
      if (!$("#paste").length) return
      this.load_hash()
      if (history.replaceState) {
        this.set_hash()
        $(document).on('click', $.proxy(this.set_hash, this))
      }
    }
  }
})(jQuery)

//= require jquery.autosize
//= require autosize-box-fix
(function($) {
  window.zp.new = {
    input: function() { return $("#paste_paste") },
    clear: function(e) {
      this.input().val("").focus()
      e.preventDefault()
    },
    init: function() {
      if (this.input().length === 0) { return }
      $(document).on('click', "#reset_paste", $.proxy(this.clear, this))
      this.input().autosize({ className: 'mirrored_text row-fluid', append: "\n"});
      $.autosize_box_fix($(".mirrored_text"))
      this.input().focus()
    }
  }
})(jQuery)

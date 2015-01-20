jQuery.fn.initialize_select = (object)->
  this.select2('destroy')
  this.select2(object)
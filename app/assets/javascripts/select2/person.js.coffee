(exports ? this).initialize_select2_person = ->  
  select = $('.select2_person')
  select.initialize_select(select2_person)
  buttons = $('#selected-buttons')
  update_buttons(buttons, '')
  select.on "change", (e) -> update_buttons(buttons, this.value)

update_buttons = (buttons, value) -> if (value == '') then buttons.hide() else buttons.fadeIn()

inputTooShort = (input, minimum) -> 
  count = minimum - input.length
  return "Ingrese 1 caracter" if (count < 1)
  return ["Ingrese", count, "caracteres"].join(' ')

format_person = (item) -> item.first_name + ' ' + item.last_name + ' ' + item.document_number

select2_person =
  placeholder:         "Buscar Persona"
  minimumInputLength:  1
  allowClear:          true
  formatSelection:     format_person
  formatResult:        format_person
  formatSearching:     "Buscando pasajero..."
  formatNoMatches:     "No encontrado."
  formatInputTooShort: inputTooShort

  ajax:
    url:      '/people'
    dataType: 'json'
    async: true
    data:     (term, page) -> {       q: term }
    results:  (data, page) -> { results: data }
  

  initSelection : (element, callback) ->
    id = $(element).val()
    return if id == ""
    $.ajax(
      type:     'get'
      dataType: 'json'
      url:      '/people/' + id
      success: (datos) -> callback(datos) if (datos != null)
    )
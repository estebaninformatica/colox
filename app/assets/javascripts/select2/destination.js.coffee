(exports ? this).initialize_select2_destination = ->
  select = $('.select2_destination')
  select.initialize_select(select2_destination)

get_name = (item) -> item.name

inputTooShort = (input, minimum) -> 
  count = minimum - input.length
  return "Ingrese 1 caracter" if (count < 1)
  return ["Ingrese", count, "caracteres"].join(' ')

select2_destination =
  placeholder:         "Buscar Destino"
  minimumInputLength:  1
  allowClear:          true
  formatSelection:     get_name
  formatResult:        get_name
  formatSearching:     "Buscando destino..."
  formatNoMatches:     "No encontrado."
  formatInputTooShort: inputTooShort

  ajax:
    url:      '/destinations'
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
      url:      '/destinations/' + id
      success: (datos) -> callback(datos) if (datos != null)
    )
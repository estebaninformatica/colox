(exports ? this).initialize_select2_operator = ->
  select = $('.select2_operator')
  select.initialize_select(select2_operator)
  select.on "change", (e) -> 
    $('#service_provider_id').load_providers(this.value)
    $('#service_tariff_attributes_aero_iva').load_iva(this.value)

jQuery.fn.load_providers = (id) ->
  url = "/operators/" + id + "/providers"
  provider_select = this
  $.getJSON(url, (result) ->
    optionsValues = ''
    $.each(result, (item) -> optionsValues += '<option value="' + result[item].id + '">' + result[item].name + '</option>')
    provider_select.html(optionsValues)
  )

jQuery.fn.load_iva = (id) ->
  url = "/operators/" + id
  iva_select = this
  $.getJSON(url, (result) ->
    category = result.id_cat2
    iva_type = result.tip_item
    if category == 1 # :argentine
      switch iva_type
        when 'H' then iva_select.val('10.5') # :gravado_10
        when 'E' then iva_select.val( '0.0') # :exento
        else          iva_select.val('21.0')
    if category == 2 # :international
      iva_select.val('21.0')
    if category == 3 # :aerial_companies
      if iva_type == 'H'
        iva_select.val('0.0') # :gravado_10
      else
        iva_select.val('10.5')
  )

inputTooShort = (input, minimum) -> 
  count = minimum - input.length
  return "Ingrese 1 caracter" if (count < 1)
  return ["Ingrese", count, "caracteres"].join(' ')

format_operator =(item) -> item.nom_ope

select2_operator =
  id: 'id_ope'
  placeholder:         "Buscar Operador"
  minimumInputLength:  3
  allowClear:          true
  formatSelection:     format_operator
  formatResult:        format_operator
  formatSearching:     "Buscando Operador..."
  formatNoMatches:     "No encontrado."
  formatInputTooShort: inputTooShort

  ajax:
    url:      '/operators'
    dataType: 'json'
    async: true
    data:     (term, page) -> { q: term }
    results:  (data, page) -> { results: data }

  initSelection: (element, callback) ->
    id = $(element).val()
    return if id == ""
    $.ajax(
      type:     'get'
      dataType: 'json'
      url:      '/operators/' + id
      success: (datos) -> callback(datos) if (datos != null)
    )
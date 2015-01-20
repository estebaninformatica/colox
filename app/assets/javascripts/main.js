// Configuracion básica de datepicker.
var datepicker_configuration = {
  changeMonth: true,
  changeYear:  true,
  yearRange:  '-110:+20',
  dateFormat: 'dd/mm/yy',
  buttonImageOnly: true,
  defaultDate: +7
}

// Inicializar datepicker.
function initialize_datepicker(){
  $(".datepicker input").datepicker("destroy");
  $(".datepicker input").datepicker(datepicker_configuration);
}
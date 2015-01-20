$( document ).ready(function() {
  function reload_provider(id,model_id){
       var provider_select, url;
       url = "/operators/" + id + "/providers";
       provider_select = $("#"+model_id+"provider");

       return $.getJSON(url, function(result) {
         var optionsValues;
         optionsValues = '';
         $.each(result, function(item) {
           return optionsValues += '<option value="' + result[item].id_prestador + '">' + result[item].nom_pre + '</option>';
         });
        provider_select.html(optionsValues);
        if ( $("#"+model_id+"provider_default_").val() !== ""){
          provider_select.val($("#"+model_id+"provider_default_").val())
        }
       });

  }
  $(".aptour_select2").select2({
      placeholder: "Buscar",
      width: '100%',
      minimumInputLength: 2,
      ajax: {
          url: "/operators.json",
          dataType: 'json',
          quietMillis: 250,
          data: function (term, page) {
              return {
                  q: term,
              };
          },
          results: function (data, page, se) {
            var model_id = se.element.context.id;
            return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.nom_ope,
                            id: item.id_ope,
                            model_id: model_id
                        }
                    })
                    };
          },
          cache: true
      },
      initSelection: function(element, callback) {
      var model_id = $(element).context.id;
      var id = $(element).val();
        if (id !== "") {
            $.ajax("/operators/"+id+".json" , {
                dataType: "json"
            }).done(function(data) {
                                    callback({
                                      text: data.nom_ope,
                                      id: data.id_ope,
                                      model_id: model_id
                                    }); });
        }
      },
      formatResult: FormatResult, // omitted for brevity, see the source of this page
      formatSelection: FormatSelectionOpe,  // omitted for brevity, see the source of this page
      dropdownCssClass: "bigdrop", 
      // apply css that makes the dropdown taller
      escapeMarkup: function (m) { return m; } // we do not want to escape markup since we are displaying html in results
  });

  function FormatResult(item) {
              return item.text;
  }

  function FormatSelectionOpe(item) {
              reload_provider(item.id,item.model_id);
              return item.text;
  }

});
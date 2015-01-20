$(".aptour_destinations_select2").select2({
      placeholder: "Buscar",
      minimumInputLength: 2,
      ajax: {
          url: "/aptour_destinations.json",
          dataType: 'json',
          quietMillis: 250,
          data: function (term, page) {
              return {
                  q: term,
              };
          },
          results: function (data, page) {
            return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.nom_des,
                            id: item.id_des
                        }
                    })
                    };
          },
          cache: true
      },
      initSelection: function(element, callback) {
      var id = $(element).val();
        if (id !== "") {
            $.ajax("/aptour_destinations/"+id+".json" , {
                dataType: "json"
            }).done(function(data) {
                                    callback({
                                      text: data.nom_des,
                                      id: data.id_des
                                    }); });
        }
      },
      formatResult: FormatResult, // omitted for brevity, see the source of this page
      formatSelection: FormatSelectionOpe,  // omitted for brevity, see the source of this page
      dropdownCssClass: "bigdrop", // apply css that makes the dropdown taller
      escapeMarkup: function (m) { return m; } // we do not want to escape markup since we are displaying html in results
  });

  function FormatResult(item) {
              return item.text;
  }

  function FormatSelectionOpe(item) {
              return item.text;
  }



   
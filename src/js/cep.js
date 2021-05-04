const cepAutoFill = function() {
  function get() {
    let items =  {}
    itemCEP = this.action.attribute01;
    items.logradouro = this.action.attribute02;
    items.complemento = this.action.attribute03;
    items.bairro = this.action.attribute04;
    items.localidade = this.action.attribute05;
    items.uf = this.action.attribute06;
    let cep = apex.item(itemCEP).getValue().replace(/\D/g, '');
    var validacep = /^[0-9]{8}$/;
    if (!cep) {
      error("O campo CEP precisa estar preenchido.");
      fill(items, "");
      return
    }
    if (!validacep.test(cep)) {
      error("CEP inválido, verifique o CEP e tente novamente.");
      fill(items, "");
      return
    }
    load.on();
    $.getJSON(`https://viacep.com.br/ws/${cep}/json`)
    .then(function(data){
      load.off();
      console.log(data);
      if (data.erro) {
        error("CEP inválido, verifique o CEP e tente novamente.");
        data = "";
      }
      fill(items, data);
    });
  }

  function fill(items, data) {
    for (let item in items) {
      let fillValue = data ? data[item] : "";
      apex.item(items[item]).setValue(fillValue);
    }
  }

  //short handle for page success
  function success(message,autoHide) {
    apex.message.showPageSuccess(message);
    if (!isNaN(autoHide)) setTimeout(() => apex.message.hidePageSuccess(), autoHide);
  }
  //easier handle for apex page error
  function error(messages,autoHide) {
    apex.message.clearErrors();
    if (!Array.isArray(messages)) {
      apex.message.showErrors({
        type:     "error",
        location: "page",
        message:  messages
      });
    } else {
      var errors = [];
      messages.map(function(message) {
        errors.push({
          type:     "error",
          location: "page",
          message:  message
        });
      });
      apex.message.showErrors(errors);
    }
    if (!isNaN(autoHide)) setTimeout(() => apex.message.clearErrors(), autoHide);
  }
  //functions to add/remove loading from apex.
  var load = {
    on: function() {
      if ($(".u-Processing").length > 0) console.log("Loading already on.");
      else $wP = apex.widget.waitPopup();
    },
    off: function() {
      if ($(".u-Processing").length > 0) setTimeout(function(){$wP.remove();},200);
      else console.log("Loading not on.")
    }
  }
  return {
    get
  }
}();
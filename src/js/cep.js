const cepAutoFill = function() {
  function get() {
    let items =  {}
    itemCEP = this.action.attribute01;
    if (this.action.attribute02) items.logradouro = this.action.attribute02;
    if (this.action.attribute03) items.complemento = this.action.attribute03;
    if (this.action.attribute04) items.bairro = this.action.attribute04;
    if (this.action.attribute05) items.localidade = this.action.attribute05;
    if (this.action.attribute06) items.uf = this.action.attribute06;
    let cep = apex.item(itemCEP).getValue().replace(/\D/g, '');
    var validacep = /^[0-9]{8}$/;
    if (!cep) {
      error("O campo CEP precisa estar preenchido.", itemCEP);
      fill(items, "");
      return
    }
    if (!validacep.test(cep)) {
      error("CEP inválido, verifique o CEP e tente novamente.", itemCEP);
      fill(items, "");
      return
    }
    apex.message.clearErrors();
    $.getJSON(`https://viacep.com.br/ws/${cep}/json`)
    .then(function(data){
      console.log(data);
      if (data.erro) {
        error("CEP inválido, verifique o CEP e tente novamente.", itemCEP);
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

  //easier handle for apex page error
  function error(messages,pageItem) {
    apex.message.clearErrors();
    apex.message.showErrors({
      type:     "error",
      location: ["page", "inline"],
      pageItem: pageItem,
      message:  messages
    });
  }
  return {
    get
  }
}();
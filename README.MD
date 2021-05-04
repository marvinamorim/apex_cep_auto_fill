# Oracle Apex CEP Auto Complete Plugin
  Plugin feito para preencher automaticamente items com as informações do CEP (rua, complemento, bairro, cidade e UF), usando como fonte de dados o sistema do [viacep.com.br](viacep.com.br)

## Instalação
  * Importe o arquivo 'dynamic_action_plugin_mvx_cep_auto_fill.sql' como plugin na sua aplicação.

## Como usar
  * Crie uma Dynamic Action (evento de Click em botão ou After Change em um item), então crie uma TRUE action com a action CEP Auto Fill [Plug-in].
  * Esta action tem 6 parâmetros:
    * CEP Item: Obrigatorio. Campo com o CEP a ser pesquisado.
    * Rua Item: Opcional. Item que irá receber o nome do logradouro do CEP de referência.
    * Complemento Item: Opcional. Item que irá receber a informação de complento do logradouro.
    * Bairro Item: Opcional. Item que irá receber o bairro do CEP de referência.
    * Cidade Item: Opcional. Item que irá receber a cidade do CEP de referência. 
    * UF Item: Opcional. Item que irá receber a UF do CEP de referência.
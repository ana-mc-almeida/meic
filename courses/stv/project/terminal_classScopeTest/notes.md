## Terminal

### Domain

- Balance aka saldo
  - Começa com 0
  - É a diferença entre pagamentos e o número das comunicações.
- cliente
- chave_unica
- modo
  - OFF

#### Modos

##### OFF

- Quando se inicia o terminal, ele começa no modo OFF.
- Permite `turnOn` e passa para o modo NORMAL.

##### NORMAL

##### SILENT

##### BUSY

### Métodos

Se algum dos métodos não puder ser chamado, deve lançar uma exceção `InvalidInvocationException`.

#### getMode

- Pode ser chamado em qualquer modo.
- Retorna o modo atual do terminal.

#### pay

- Só pode ser chamado quando o terminal está em modo OFF.
- A quantia deve ser sempre superior a 5.

#### balance

- Desde que o terminal não esteja ocupado.
  - Ou seja, ou está em modo OFF, NORMAL ou SILENT.

#### sendSMS

- Terminal deve estar ligado e não ocupado.
  - Ou seja, ou está em modo NORMAL ou SILENT.
- Pode mandar mensagens para qualquer terminal, incluindo ele mesmo.

#### receiveSMS

- Terminal deve estar ligado.
  - Ou seja, ou está em modo NORMAL, SILENT ou BUSY.
- Se estiver em modo SILENT o client associado ao terminal que envia a mensagem deve pertencer aos amigos do cliente associado ao terminal que recebe a mensagem.

#### makeVoiceCall

- Só pode chamar esta função um terminal ligado e não ocupado.
  - Ou seja, ou está em modo NORMAL ou SILENT.
- O terminal que recebe a chamada tem de poder aceitar a chamada.
  - Ver `acceptVoiceCall`.
- Se a chamada se puder concretizar, os dois terminais devem passar para o modo BUSY.

#### acceptVoiceCall

- Só pode aceitar uma chamada se o terminal estiver no modo NORMAL.
- Se a chamada se puder concretizar, os dois terminais devem passar para o modo BUSY.

#### turnOn

- [ ] Não tenho a certeza se pode ser chamado quando o terminal está em um modo diferente de OFF.

#### turnOff

- Passar para o modo OFF.
- Só se p terminal estiver ligado e não ocupado.
  - Ou seja, ou está em modo NORMAL ou SILENT.

#### toggleOnMode

- Passar de modo NORMAL para SILENT e vice-versa.

#### endOngoingCommunication

- Sair de modo BUSY.
- Voltar para o modo anterior.
  - Ou seja, ou modo NORMAL ou SILENT.

### Conclusions

- Class Modality: Diria `Modal`, mas como não há restrições relativamente ao saldo acho que é para `Uni-modal`.

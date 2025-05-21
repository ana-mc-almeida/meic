# Develop test data for each path using Invariant Boundaries pattern for events, messages and actions

### Pay in OFF

| Condition | On Point | Off Point |
| --------- | -------- | --------- |
| amount>=5 | 5        | 4         |
| amount<5  | 5        | 6         |

### makeVoiceCall in NORMAL

| Condition       | On Point | Off Point |
| --------------- | -------- | --------- |
| to.mode==NORMAL | NORMAL   | SILENT    |
| to.mode!=NORMAL | NORMAL   | OFF       |

### endOngoingCommunication in BUSY

| Condition                                    | On Point | Off Point |
| -------------------------------------------- | -------- | --------- |
| previousMode==NORMAL                         | NORMAL   | SILENT    |
| previousMode==SILENT                         | SILENT   | NORMAL    |
| previousMode!=NORMAL && previousMode!=SILENT | NORMAL   | OFF       |

### receiveMessage in SILENT

| Condition                      | On Point | Off Point |
| ------------------------------ | -------- | --------- |
| client.hasFriend(from.client)  | true     | false     |
| !client.hasFriend(from.client) | false    | true      |

### makeVoiceCall in SILENT

| Condition       | On Point | Off Point |
| --------------- | -------- | --------- |
| to.mode==NORMAL | NORMAL   | OFF       |
| to.mode!=NORMAL | NORMAL   | BUSY      |

| State  | Message                 | Condition                                                      | Next State |
| ------ | ----------------------- | -------------------------------------------------------------- | ---------- |
| OFF    | pay                     | Pre: amount >= 5                                               | OFF        |
| NORMAL | makeVoiceCall           | Pre: to.MODE == NORMAL                                         | BUSY       |
| SILENT | makeVoiceCall           | Pre: to.MODE == NORMAL                                         | BUSY       |
| SILENT | receiveSMS              | Pre: client.hasFriend(from.client)                             | SILENT     |
| BUSY   | receiveSMS              | Pre: previousMode == NORMAL \|\| client.hasFriend(from.client) | BUSY       |
| BUSY   | endOngoingCommunication | Pre: previousMode == NORMAL                                    | NORMAL     |
| BUSY   | endOngoingCommunication | Pre: previousMode == SILENT                                    | SILENT     |

- `pay` in OFF generates an additional transition when amount < 5
- `makeVoiceCall` in NORMAL generates an additional transition when to.MODE != NORMAL
- `makeVoiceCall` in SILENT generates an additional transition when to.MODE != NORMAL
- `receiveSMS` in SILENT generates an additional transition when !client.hasFriend(from.client)
- `receiveSMS` in BUSY generates an additional transition when previousMode != NORMAL and !client.hasFriend(from.client)

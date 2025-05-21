| State  | Message                 | Condition                          | Next State |
| ------ | ----------------------- | ---------------------------------- | ---------- |
| OFF    | pay                     | Pre: amount > 5                    | OFF        |
| NORMAL | makeVoiceCall           | Pre: to.MODE == NORMAL             | BUSY       |
| SILENT | makeVoiceCall           | Pre: to.MODE == NORMAL             | BUSY       |
| SILENT | receiveMessage          | Pre: client.hasFriend(from.client) | SILENT     |
| BUSY   | endOngoingCommunication | Pre: previousMode == NORMAL        | NORMAL     |
| BUSY   | endOngoingCommunication | Pre: previousMode == SILENT        | SILENT     |

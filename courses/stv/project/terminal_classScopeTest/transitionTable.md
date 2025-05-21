## Transition Table

VT = Valid Transition, PSP = Possible sneak path, ? = Conditional Transition

| Events \ State          | OFF | NORMAL | BUSY | SILENT |
| ----------------------- | --- | ------ | ---- | ------ |
| balace                  | VT  | VT     | VT   | VT     |
| pay                     | ?   | PSP    | PSP  | PSP    |
| turnOn                  | VT  | PSP    | PSP  | PSP    |
| turnOff                 | PSP | VT     | PSP  | VT     |
| toggleOnMode            | PSP | VT     | PSP  | VT     |
| makeVoiceCall           | PSP | ?      | PSP  | ?      |
| acceptVoiceCall         | PSP | VT     | PSP  | PSP    |
| sendMessage             | PSP | VT     | PSP  | VT     |
| receiveMessage          | PSP | VT     | VT   | ?      |
| endOngoingCommunication | PSP | PSP    | ?    | PSP    |

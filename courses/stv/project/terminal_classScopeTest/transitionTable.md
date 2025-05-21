## Transition Table

VT = Valid Transition, PSP = Possible sneak path, ? = Conditional Transition

| Events \ State          | OFF | NORMAL | BUSY | SILENT |
| ----------------------- | --- | ------ | ---- | ------ |
| getMode                 | VT  | VT     | VT   | VT     |
| balace                  | VT  | VT     | PSP  | VT     |
| pay                     | ?   | PSP    | PSP  | PSP    |
| turnOn                  | VT  | PSP    | PSP  | PSP    |
| turnOff                 | PSP | VT     | PSP  | VT     |
| toggleOnMode            | PSP | VT     | PSP  | VT     |
| makeVoiceCall           | PSP | ?      | PSP  | ?      |
| acceptVoiceCall         | PSP | VT     | PSP  | PSP    |
| sendSMS                 | PSP | VT     | PSP  | VT     |
| receiveSMS              | PSP | VT     | ?    | ?      |
| endOngoingCommunication | PSP | PSP    | ?    | PSP    |

# Conformance Test Suites <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Initial Conformance Test Suites](#initial-conformance-test-suites)
- [Add the sneak path test suite](#add-the-sneak-path-test-suite)
- [Final Conformance Test Suites](#final-conformance-test-suites)

</details>

## Initial Conformance Test Suites

| Run | Level 1 | Level 2              | Level 3                               | Level 4                                                                      | Expected Terminal State |
| --- | ------- | -------------------- | ------------------------------------- | ---------------------------------------------------------------------------- | ----------------------- |
| 1   | new     | -                    | -                                     | -                                                                            | OFF                     |
| 2   | new     | balance              | -                                     | -                                                                            | OFF                     |
| 3   | new     | [amount>=5] pay      | -                                     | -                                                                            | OFF                     |
| 4   | new     | [amount<5] pay/error | -                                     | -                                                                            | OFF                     |
| 5   | new     | turnOn               | -                                     | -                                                                            | NORMAL                  |
| 6   | new     | turnOn               | acceptVoiceCall                       | -                                                                            | BUSY                    |
| 7   | new     | turnOn               | [to.mode==NORMAL] makeVoiceCall       | -                                                                            | BUSY                    |
| 8   | new     | turnOn               | [to.mode!=NORMAL] makeVoiceCall/error | -                                                                            | NORMAL                  |
| 9   | new     | turnOn               | balance                               | -                                                                            | NORMAL                  |
| 10  | new     | turnOn               | sendMessage                           | -                                                                            | NORMAL                  |
| 11  | new     | turnOn               | receiveMessage                        | -                                                                            | NORMAL                  |
| 12  | new     | turnOn               | turnOff                               | -                                                                            | OFF                     |
| 13  | new     | turnOn               | toggleOnMode                          | -                                                                            | SILENT                  |
| 14  | new     | turnOn               | acceptVoiceCall                       | receiveMessage                                                               | BUSY                    |
| 15  | new     | turnOn               | acceptVoiceCall                       | [previousMode!=NORMAL && previousMode!=SILENT] endOngoingCommunication/error | BUSY                    |
| 16  | new     | turnOn               | acceptVoiceCall                       | [previousMode==NORMAL] endOngoingCommunication                               | NORMAL                  |
| 17  | new     | turnOn               | acceptVoiceCall                       | [previousMode==SILENT] endOngoingCommunication                               | SILENT                  |
| 18  | new     | turnOn               | toggleOnMode                          | turnOff                                                                      | OFF                     |
| 19  | new     | turnOn               | toggleOnMode                          | balance                                                                      | SILENT                  |
| 20  | new     | turnOn               | toggleOnMode                          | sendMessage                                                                  | SILENT                  |
| 21  | new     | turnOn               | toggleOnMode                          | [client.hasFriend(from.client)] receiveMessage                               | SILENT                  |
| 22  | new     | turnOn               | toggleOnMode                          | [!client.hasFriend(from.client)] receiveMessage/error                        | SILENT                  |
| 23  | new     | turnOn               | toggleOnMode                          | [to.mode!=NORMAL] makeVoiceCall/error                                        | SILENT                  |
| 24  | new     | turnOn               | toggleOnMode                          | [to.mode==NORMAL] makeVoiceCall                                              | BUSY                    |
| 25  | new     | turnOn               | toggleOnMode                          | toggleOnMode                                                                 | NORMAL                  |

## Add the sneak path test suite

| Run | Level 1 | Level 2                 | Level 3                 | Level 4                 | Expected Terminal State | Error |
| --- | ------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- | ----- |
| 25  | new     | turnOff                 | -                       | -                       | OFF                     | Error |
| 26  | new     | toggleOnMode            | -                       | -                       | OFF                     | Error |
| 27  | new     | makeVoiceCall           | -                       | -                       | OFF                     | Error |
| 28  | new     | acceptVoiceCall         | -                       | -                       | OFF                     | Error |
| 29  | new     | sendMessage             | -                       | -                       | OFF                     | Error |
| 30  | new     | receiveMessage          | -                       | -                       | OFF                     | Error |
| 31  | new     | endOngoingCommunication | -                       | -                       | OFF                     | Error |
| 32  | new     | turnOn                  | pay                     | -                       | NORMAL                  | Error |
| 33  | new     | turnOn                  | turnOn                  | -                       | NORMAL                  | Error |
| 34  | new     | turnOn                  | endOngoingCommunication | -                       | NORMAL                  | Error |
| 35  | new     | turnOn                  | acceptVoiceCall         | pay                     | BUSY                    | Error |
| 36  | new     | turnOn                  | acceptVoiceCall         | turnOn                  | BUSY                    | Error |
| 37  | new     | turnOn                  | acceptVoiceCall         | turnOff                 | BUSY                    | Error |
| 38  | new     | turnOn                  | acceptVoiceCall         | toggleOnMode            | BUSY                    | Error |
| 39  | new     | turnOn                  | acceptVoiceCall         | makeVoiceCall           | BUSY                    | Error |
| 40  | new     | turnOn                  | acceptVoiceCall         | acceptVoiceCall         | BUSY                    | Error |
| 41  | new     | turnOn                  | acceptVoiceCall         | sendMessage             | BUSY                    | Error |
| 42  | new     | turnOn                  | toggleOnMode            | pay                     | SILENT                  | Error |
| 43  | new     | turnOn                  | toggleOnMode            | turnOn                  | SILENT                  | Error |
| 44  | new     | turnOn                  | toggleOnMode            | acceptVoiceCall         | SILENT                  | Error |
| 45  | new     | turnOn                  | toggleOnMode            | endOngoingCommunication | SILENT                  | Error |

## Final Conformance Test Suites

| Run | Level 1 | Level 2                 | Level 3                               | Level 4                                                                      | Expected Terminal State | Error |
| --- | ------- | ----------------------- | ------------------------------------- | ---------------------------------------------------------------------------- | ----------------------- | ----- |
| 1   | new     | -                       | -                                     | -                                                                            | OFF                     | No    |
| 2   | new     | balance                 | -                                     | -                                                                            | OFF                     | No    |
| 3   | new     | [amount>=5] pay         | -                                     | -                                                                            | OFF                     | No    |
| 4   | new     | [amount<5] pay/error    | -                                     | -                                                                            | OFF                     | No    |
| 5   | new     | turnOn                  | -                                     | -                                                                            | NORMAL                  | No    |
| 6   | new     | turnOn                  | acceptVoiceCall                       | -                                                                            | BUSY                    | No    |
| 7   | new     | turnOn                  | [to.mode==NORMAL] makeVoiceCall       | -                                                                            | BUSY                    | No    |
| 8   | new     | turnOn                  | [to.mode!=NORMAL] makeVoiceCall/error | -                                                                            | NORMAL                  | No    |
| 9   | new     | turnOn                  | balance                               | -                                                                            | NORMAL                  | No    |
| 10  | new     | turnOn                  | sendMessage                           | -                                                                            | NORMAL                  | No    |
| 11  | new     | turnOn                  | receiveMessage                        | -                                                                            | NORMAL                  | No    |
| 12  | new     | turnOn                  | turnOff                               | -                                                                            | OFF                     | No    |
| 13  | new     | turnOn                  | toggleOnMode                          | -                                                                            | SILENT                  | No    |
| 14  | new     | turnOn                  | acceptVoiceCall                       | receiveMessage                                                               | BUSY                    | No    |
| 15  | new     | turnOn                  | acceptVoiceCall                       | [previousMode!=NORMAL && previousMode!=SILENT] endOngoingCommunication/error | BUSY                    | No    |
| 16  | new     | turnOn                  | acceptVoiceCall                       | [previousMode==NORMAL] endOngoingCommunication                               | NORMAL                  | No    |
| 17  | new     | turnOn                  | acceptVoiceCall                       | [previousMode==SILENT] endOngoingCommunication                               | SILENT                  | No    |
| 18  | new     | turnOn                  | toggleOnMode                          | turnOff                                                                      | OFF                     | No    |
| 19  | new     | turnOn                  | toggleOnMode                          | balance                                                                      | SILENT                  | No    |
| 20  | new     | turnOn                  | toggleOnMode                          | sendMessage                                                                  | SILENT                  | No    |
| 21  | new     | turnOn                  | toggleOnMode                          | [client.hasFriend(from.client)] receiveMessage                               | SILENT                  | No    |
| 22  | new     | turnOn                  | toggleOnMode                          | [!client.hasFriend(from.client)] receiveMessage/error                        | SILENT                  | No    |
| 23  | new     | turnOn                  | toggleOnMode                          | [to.mode!=NORMAL] makeVoiceCall/error                                        | SILENT                  | No    |
| 24  | new     | turnOn                  | toggleOnMode                          | [to.mode==NORMAL] makeVoiceCall                                              | BUSY                    | No    |
| 25  | new     | turnOn                  | toggleOnMode                          | toggleOnMode                                                                 | NORMAL                  | No    |
| 25  | new     | turnOff                 | -                                     | -                                                                            | OFF                     | Error |
| 26  | new     | toggleOnMode            | -                                     | -                                                                            | OFF                     | Error |
| 27  | new     | makeVoiceCall           | -                                     | -                                                                            | OFF                     | Error |
| 28  | new     | acceptVoiceCall         | -                                     | -                                                                            | OFF                     | Error |
| 29  | new     | sendMessage             | -                                     | -                                                                            | OFF                     | Error |
| 30  | new     | receiveMessage          | -                                     | -                                                                            | OFF                     | Error |
| 31  | new     | endOngoingCommunication | -                                     | -                                                                            | OFF                     | Error |
| 32  | new     | turnOn                  | pay                                   | -                                                                            | NORMAL                  | Error |
| 33  | new     | turnOn                  | turnOn                                | -                                                                            | NORMAL                  | Error |
| 34  | new     | turnOn                  | endOngoingCommunication               | -                                                                            | NORMAL                  | Error |
| 35  | new     | turnOn                  | acceptVoiceCall                       | pay                                                                          | BUSY                    | Error |
| 36  | new     | turnOn                  | acceptVoiceCall                       | turnOn                                                                       | BUSY                    | Error |
| 37  | new     | turnOn                  | acceptVoiceCall                       | turnOff                                                                      | BUSY                    | Error |
| 38  | new     | turnOn                  | acceptVoiceCall                       | toggleOnMode                                                                 | BUSY                    | Error |
| 39  | new     | turnOn                  | acceptVoiceCall                       | makeVoiceCall                                                                | BUSY                    | Error |
| 40  | new     | turnOn                  | acceptVoiceCall                       | acceptVoiceCall                                                              | BUSY                    | Error |
| 41  | new     | turnOn                  | acceptVoiceCall                       | sendMessage                                                                  | BUSY                    | Error |
| 42  | new     | turnOn                  | toggleOnMode                          | pay                                                                          | SILENT                  | Error |
| 43  | new     | turnOn                  | toggleOnMode                          | turnOn                                                                       | SILENT                  | Error |
| 44  | new     | turnOn                  | toggleOnMode                          | acceptVoiceCall                                                              | SILENT                  | Error |
| 45  | new     | turnOn                  | toggleOnMode                          | endOngoingCommunication                                                      | SILENT                  | Error |

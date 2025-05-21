# Conformance Test Suites <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Initial Conformance Test Suites](#initial-conformance-test-suites)
- [Add the sneak path test suite](#add-the-sneak-path-test-suite)
- [Final Conformance Test Suites](#final-conformance-test-suites)

</details>

## Initial Conformance Test Suites

| Run | Level 1 | Level 2         | Level 3                         | Level 4                                                              | Expected Terminal State | Error |
| --- | ------- | --------------- | ------------------------------- | -------------------------------------------------------------------- | ----------------------- | ----- |
| 1   | new     | -               | -                               | -                                                                    | OFF                     | No    |
| 2   | new     | getMode         | -                               | -                                                                    | OFF                     | No    |
| 3   | new     | balance         | -                               | -                                                                    | OFF                     | No    |
| 4   | new     | [amount>=5] pay | -                               | -                                                                    | OFF                     | No    |
| 5   | new     | [amount<5] pay  | -                               | -                                                                    | OFF                     | Yes   |
| 6   | new     | turnOn          | -                               | -                                                                    | NORMAL                  | No    |
| 7   | new     | turnOn          | acceptVoiceCall                 | -                                                                    | BUSY                    | No    |
| 8   | new     | turnOn          | [to.mode==NORMAL] makeVoiceCall | -                                                                    | BUSY                    | No    |
| 9   | new     | turnOn          | [to.mode!=NORMAL] makeVoiceCall | -                                                                    | NORMAL                  | Yes   |
| 10  | new     | turnOn          | balance                         | -                                                                    | NORMAL                  | No    |
| 11  | new     | turnOn          | sendSMS                         | -                                                                    | NORMAL                  | No    |
| 12  | new     | turnOn          | receiveSMS                      | -                                                                    | NORMAL                  | No    |
| 13  | new     | turnOn          | getMode                         | -                                                                    | NORMAL                  | No    |
| 14  | new     | turnOn          | turnOff                         | -                                                                    | OFF                     | No    |
| 15  | new     | turnOn          | toggleOnMode                    | -                                                                    | SILENT                  | No    |
| 16  | new     | turnOn          | acceptVoiceCall                 | getMode                                                              | BUSY                    | No    |
| 17  | new     | turnOn          | acceptVoiceCall                 | [previousMode==NORMAL \|\| client.hasFriend(from.client)] receiveSMS | BUSY                    | No    |
| 18  | new     | turnOn          | acceptVoiceCall                 | [previousMode!=NORMAL && !client.hasFriend(from.client)] receiveSMS  | BUSY                    | Yes   |
| 19  | new     | turnOn          | acceptVoiceCall                 | [previousMode==NORMAL] endOngoingCommunication                       | NORMAL                  | No    |
| 20  | new     | turnOn          | acceptVoiceCall                 | [previousMode==SILENT] endOngoingCommunication                       | SILENT                  | No    |
| 21  | new     | turnOn          | toggleOnMode                    | turnOff                                                              | OFF                     | No    |
| 22  | new     | turnOn          | toggleOnMode                    | getMode                                                              | SILENT                  | No    |
| 23  | new     | turnOn          | toggleOnMode                    | balance                                                              | SILENT                  | No    |
| 24  | new     | turnOn          | toggleOnMode                    | sendSMS                                                              | SILENT                  | No    |
| 25  | new     | turnOn          | toggleOnMode                    | [client.hasFriend(from.client)] receiveSMS                           | SILENT                  | No    |
| 26  | new     | turnOn          | toggleOnMode                    | [!client.hasFriend(from.client)] receiveSMS                          | SILENT                  | Yes   |
| 27  | new     | turnOn          | toggleOnMode                    | [to.mode!=NORMAL] makeVoiceCall                                      | SILENT                  | Yes   |
| 28  | new     | turnOn          | toggleOnMode                    | [to.mode==NORMAL] makeVoiceCall                                      | BUSY                    | No    |
| 29  | new     | turnOn          | toggleOnMode                    | toggleOnMode                                                         | NORMAL                  | No    |

## Add the sneak path test suite

| Run | Level 1 | Level 2                 | Level 3                 | Level 4                 | Expected Terminal State | Error |
| --- | ------- | ----------------------- | ----------------------- | ----------------------- | ----------------------- | ----- |
| 30  | new     | turnOff                 | -                       | -                       | OFF                     | Yes   |
| 31  | new     | toggleOnMode            | -                       | -                       | OFF                     | Yes   |
| 32  | new     | makeVoiceCall           | -                       | -                       | OFF                     | Yes   |
| 33  | new     | acceptVoiceCall         | -                       | -                       | OFF                     | Yes   |
| 34  | new     | sendSMS                 | -                       | -                       | OFF                     | Yes   |
| 35  | new     | receiveSMS              | -                       | -                       | OFF                     | Yes   |
| 36  | new     | endOngoingCommunication | -                       | -                       | OFF                     | Yes   |
| 37  | new     | turnOn                  | pay                     | -                       | NORMAL                  | Yes   |
| 38  | new     | turnOn                  | turnOn                  | -                       | NORMAL                  | Yes   |
| 39  | new     | turnOn                  | endOngoingCommunication | -                       | NORMAL                  | Yes   |
| 40  | new     | turnOn                  | acceptVoiceCall         | balance                 | BUSY                    | Yes   |
| 41  | new     | turnOn                  | acceptVoiceCall         | pay                     | BUSY                    | Yes   |
| 42  | new     | turnOn                  | acceptVoiceCall         | turnOn                  | BUSY                    | Yes   |
| 43  | new     | turnOn                  | acceptVoiceCall         | turnOff                 | BUSY                    | Yes   |
| 44  | new     | turnOn                  | acceptVoiceCall         | toggleOnMode            | BUSY                    | Yes   |
| 45  | new     | turnOn                  | acceptVoiceCall         | makeVoiceCall           | BUSY                    | Yes   |
| 46  | new     | turnOn                  | acceptVoiceCall         | acceptVoiceCall         | BUSY                    | Yes   |
| 47  | new     | turnOn                  | acceptVoiceCall         | sendSMS                 | BUSY                    | Yes   |
| 48  | new     | turnOn                  | toggleOnMode            | pay                     | SILENT                  | Yes   |
| 49  | new     | turnOn                  | toggleOnMode            | turnOn                  | SILENT                  | Yes   |
| 50  | new     | turnOn                  | toggleOnMode            | acceptVoiceCall         | SILENT                  | Yes   |
| 51  | new     | turnOn                  | toggleOnMode            | endOngoingCommunication | SILENT                  | Yes   |

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
| 10  | new     | turnOn                  | sendSMS                               | -                                                                            | NORMAL                  | No    |
| 11  | new     | turnOn                  | receiveSMS                            | -                                                                            | NORMAL                  | No    |
| 12  | new     | turnOn                  | turnOff                               | -                                                                            | OFF                     | No    |
| 13  | new     | turnOn                  | toggleOnMode                          | -                                                                            | SILENT                  | No    |
| 14  | new     | turnOn                  | acceptVoiceCall                       | receiveSMS                                                                   | BUSY                    | No    |
| 15  | new     | turnOn                  | acceptVoiceCall                       | [previousMode!=NORMAL && previousMode!=SILENT] endOngoingCommunication/error | BUSY                    | No    |
| 16  | new     | turnOn                  | acceptVoiceCall                       | [previousMode==NORMAL] endOngoingCommunication                               | NORMAL                  | No    |
| 17  | new     | turnOn                  | acceptVoiceCall                       | [previousMode==SILENT] endOngoingCommunication                               | SILENT                  | No    |
| 18  | new     | turnOn                  | toggleOnMode                          | turnOff                                                                      | OFF                     | No    |
| 19  | new     | turnOn                  | toggleOnMode                          | balance                                                                      | SILENT                  | No    |
| 20  | new     | turnOn                  | toggleOnMode                          | sendSMS                                                                      | SILENT                  | No    |
| 21  | new     | turnOn                  | toggleOnMode                          | [client.hasFriend(from.client)] receiveSMS                                   | SILENT                  | No    |
| 22  | new     | turnOn                  | toggleOnMode                          | [!client.hasFriend(from.client)] receiveSMS/error                            | SILENT                  | No    |
| 23  | new     | turnOn                  | toggleOnMode                          | [to.mode!=NORMAL] makeVoiceCall/error                                        | SILENT                  | No    |
| 24  | new     | turnOn                  | toggleOnMode                          | [to.mode==NORMAL] makeVoiceCall                                              | BUSY                    | No    |
| 25  | new     | turnOn                  | toggleOnMode                          | toggleOnMode                                                                 | NORMAL                  | No    |
| 25  | new     | turnOff                 | -                                     | -                                                                            | OFF                     | Yes   |
| 26  | new     | toggleOnMode            | -                                     | -                                                                            | OFF                     | Yes   |
| 27  | new     | makeVoiceCall           | -                                     | -                                                                            | OFF                     | Yes   |
| 28  | new     | acceptVoiceCall         | -                                     | -                                                                            | OFF                     | Yes   |
| 29  | new     | sendSMS                 | -                                     | -                                                                            | OFF                     | Yes   |
| 30  | new     | receiveSMS              | -                                     | -                                                                            | OFF                     | Yes   |
| 31  | new     | endOngoingCommunication | -                                     | -                                                                            | OFF                     | Yes   |
| 32  | new     | turnOn                  | pay                                   | -                                                                            | NORMAL                  | Yes   |
| 33  | new     | turnOn                  | turnOn                                | -                                                                            | NORMAL                  | Yes   |
| 34  | new     | turnOn                  | endOngoingCommunication               | -                                                                            | NORMAL                  | Yes   |
| 35  | new     | turnOn                  | acceptVoiceCall                       | pay                                                                          | BUSY                    | Yes   |
| 36  | new     | turnOn                  | acceptVoiceCall                       | turnOn                                                                       | BUSY                    | Yes   |
| 37  | new     | turnOn                  | acceptVoiceCall                       | turnOff                                                                      | BUSY                    | Yes   |
| 38  | new     | turnOn                  | acceptVoiceCall                       | toggleOnMode                                                                 | BUSY                    | Yes   |
| 39  | new     | turnOn                  | acceptVoiceCall                       | makeVoiceCall                                                                | BUSY                    | Yes   |
| 40  | new     | turnOn                  | acceptVoiceCall                       | acceptVoiceCall                                                              | BUSY                    | Yes   |
| 41  | new     | turnOn                  | acceptVoiceCall                       | sendSMS                                                                      | BUSY                    | Yes   |
| 42  | new     | turnOn                  | toggleOnMode                          | pay                                                                          | SILENT                  | Yes   |
| 43  | new     | turnOn                  | toggleOnMode                          | turnOn                                                                       | SILENT                  | Yes   |
| 44  | new     | turnOn                  | toggleOnMode                          | acceptVoiceCall                                                              | SILENT                  | Yes   |
| 45  | new     | turnOn                  | toggleOnMode                          | endOngoingCommunication                                                      | SILENT                  | Yes   |

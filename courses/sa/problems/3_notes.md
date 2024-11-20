# Notes from Problem Class 3

**Main Topic: Design Youtube**


<details>
<summary>Table of Contents</summary>

- [Notes from Problem Class 3](#notes-from-problem-class-3)
  - [Functionalities](#functionalities)
    - [Upload a video](#upload-a-video)
    - [Visualize a video](#visualize-a-video)
  - [Qualities](#qualities)
    - [Upload Service is Available 99.99% of the time](#upload-service-is-available-9999-of-the-time)
    - [Visualizing Video is Available 99.9999% of the time](#visualizing-video-is-available-999999-of-the-time)
    - [Performance](#performance)
  - [Structure](#structure)

</details>

## Functionalities

Responsabilities:
- Handle metadata
- Handle video
- Authentication
- Transcoding Responsabilit**ies**

### Upload a video

An authenticated user can upload a video. The allowed formats are F1, F2, ... Fm and include metadata about MD1, MD2, ... MDn.
The video is stored in resolution R1, R2, ... Rk and with subtitles in S1, S2, ... Sl and formats F1, F2, ... Fx. 
And ...

### Visualize a video

A user visualizes a video using its own device and network.

## Qualities

### Upload Service is Available 99.99% of the time
(Senario: When Youtube crashes, it continues to provide upload services with availability = 99.99%)


### Visualizing Video is Available 99.9999% of the time
(Senario: When Youtube crashes, it continues to provide video visualization services with availability = 99.9999%)

### Performance

- Visualiza
  - less than 1 second
  - Smoth video visualization (the video should not stop while playing)
- Upload
  - Measure: SIZE / TIME

## Structure
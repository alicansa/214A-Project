- Audio files are of 8kHz, int-16, big-endian sphere format
- Annotation label files have a file extension of ".txt"

Each label file starts with the name of the file
Subsequent lines contains the start time in msec, end time in msec, and the non-speech label -- sil=silence, sp=short pause.
Note that non-labeled/missing time intervals contain speech.
The last line contains '.' to denote the end of the label.
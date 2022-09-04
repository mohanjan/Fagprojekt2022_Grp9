%%
MIDI = 11:118

note0 = [15.434 16.352 17.324 18.354 19.445 20.602 21.827 23.125 24.5 25.957 27.5 29.135]
note1 = note0*2
note2 = note1*2
note3 = note2*2
note4 = note3*2
note5 = note4*2
note6 = note5*2
note7 = note6*2
note8 = note7*2

note = [note0 note1 note2 note3 note4 note5 note6 note7 note8]

semilogy(MIDI,note)

fs = 44100; %サンプリング周波数

t = (0:1/fs:10)';

y = sin(2*pi*440*t);

audiowrite("A4.wav",y,fs)

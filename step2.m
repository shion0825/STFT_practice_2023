%ラの音データ読み込み
[y,fs] = audioread("A4.wav");

%fft長取得
length= size(y,1);

%fftsize定義
fftsize = 1024;

%shiftsize定義
shiftsize = fftsize/2;

%ハン窓作成
window = hann(fftsize);

%行サイズ計算
n_row = ceil((length-fftsize)/shiftsize)+1;

%paddingsize計算
paddingsize = fftsize -1;

%zeros生成
padding = zeros(paddingsize,1);

%padding結合
y_padding = [y;padding];

%spec定義
spec = zeros(fftsize,n_row);

for n = 1:n_row
    %yから抽出
    vec = y(1+(n-1)*shiftsize:fftsize+(n-1)*shiftsize,1);

    %ハン窓乗算
    vec_window = vec .* window;

    %fft
    dft_y = fft(vec_window);

    %結果格納
    spec(:,n) = dft_y; 
end

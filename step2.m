%ラの音データ読み込み
[y,fs] = audioread("A4.wav");

%信号長取得
signalLength = size(y,1);

%fftSize定義
fftSize = 1024;

%shiftSize定義
shiftSize = fftSize / 2;

%ハン窓作成
window = hann(fftSize);

%行サイズ計算
numRow = ceil((signalLength - fftSize) / shiftSize) + 1;

%paddingSize計算
paddingSize = fftSize - 1;

%zeros生成
padding = zeros(paddingSize,1);

%padding結合
yPadding = [y;padding];

%spec定義
spec = zeros(fftSize,numRow);

for n = 1:numRow
    %yから抽出
    vec = yPadding(1 + (n - 1)*shiftSize:fftSize + (n - 1)*shiftSize,1);

    %ハン窓乗算
    vecWindow = vec .* window;

    %fft
    yDft = fft(vecWindow);

    %結果格納
    spec(:,n) = yDft;
end

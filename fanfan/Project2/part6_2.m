I1 = imread('img/6.jpg');
I2 = imread('img/5.jpg');
imtool(stereoAnaglyph(I1,I2));
figure
imshow(stereoAnaglyph(I1,I2));
title('Red-cyan composite view of the stereo images');


disparityRange = [-112 320];
disparityMap = disparity(rgb2gray(I1),rgb2gray(I2),'BlockSize',...
    15,'DisparityRange',disparityRange);
figure
imshow(disparityMap,disparityRange);
title('Disparity Map');
colormap default
colorbar
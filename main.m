% Matlab R2013a

clc; clear all; close all;

%% Original images

imgI1 = imread('tangsengnew.jpg');    % read source JPEG image into 3D array
figure('Name','original tangseng');
imshow(uint8(imgI1));                 % display original image 1 in a figure

imgI2 = imread('wukongnew.jpg');      % read source JPEG image into 3D array
figure('Name','original wukong');
imshow(uint8(imgI2));                 % display original image 2 in a figure

%% Filtering

cutoff_high = 8;                      % low-pass filter thread
cutoff_low = 0.8;                     % high-pass filter thread

Filter_G = fspecial('gaussian', [30 30], cutoff_high);  % low-pass filter
Filter_L = fspecial('laplacian', cutoff_low);           % high-pass filter

imgI1 = rgb2hsv(imgI1);     
imgI1 = hsv2rgb(imgI1);                     % just to change it from uint8 to double
IG = imfilter(imgI1, Filter_G, 'same');     % implement Gaussian low-pass filter to image 1
figure('Name','Low-pass tangseng');
imshow(IG);                                 % display high-pass image 1 in a figure

imgI2 = rgb2hsv(imgI2);                     % convert image 2 from RGB to HSV
IL = imgI2;
imgI2 = imgI2(:, :, 3);                     % gray scale value
IL3 = imfilter(imgI2, Filter_L, 'same');    % implement Laplacian high-pass filter to image 2

IL3_MIN = min(min(IL3));
IL3_MAX = max(max(IL3));
IL(:, :, 3) = (IL3-IL3_MIN)/(IL3_MAX - IL3_MIN);
IL = hsv2rgb(IL);                           % convert image 2 from HSV to RGB
figure('Name','High-pass tangseng');
imshow(IL);                                 % display low-pass image 2 in a figure

%% Hybrid Imaging

H = 0.5*IG + 0.8*IL;
figure('Name','Hybrid Image');
imshow(H);                                  % display hybrid image in a figure
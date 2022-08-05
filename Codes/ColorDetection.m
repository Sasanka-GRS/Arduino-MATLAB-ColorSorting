% Color Detection
clc
clear all

m = 'test.jpeg';
[im,cmap] = imread(m);
s = size(im);
s = size(s);

if(s(2)~=3)
    im = ind2rgb(im,cmap);
end

figure();
imshow(im);

figure();
% Red Detection
r = im(:,:,1); 
g = im(:,:,2); 
b = im(:,:,3); % r = red object g = green and b = blue objects

RedPart = imsubtract(r,rgb2gray(im));
RedPart = medfilt2(RedPart,[3 3]);
BlackNWhite = imbinarize(RedPart,0.2);
area_r = bwareaopen(BlackNWhite,300);
R = sum(area_r(:));
rm = immultiply(area_r,r);  
gm = g.*0;
bm = b.*0;

FinalDetectionRed = cat(3,rm,gm,bm);
subplot(3,1,1);
imshow(FinalDetectionRed);
title('RED');                              
    
% Green color detection 
GreenPart = imsubtract(g,rgb2gray(im));
GreenPart = medfilt2(GreenPart,[3 3]);
BlackNWhite = imbinarize(GreenPart,0.071);
area_g = bwareaopen(BlackNWhite,300);
G = sum(area_g(:));
gm = immultiply(area_g,g);
rm = r.*0;  
bm = b.*0;

FinalDetectionGreen = cat(3,rm,gm,bm);
subplot(3,1,2);
imshow(FinalDetectionGreen);
title('GREEN');
     
% Blue color detection
BluePart = imsubtract(b,rgb2gray(im));
BluePart = medfilt2(BluePart,[3 3]);
BlackNWhite = imbinarize(BluePart,0.2);
area_b = bwareaopen(BlackNWhite,300);
B=sum(area_b(:));
bm=immultiply(area_b,b);  
gm = g.*0;  
rm = r.*0;

FinalDetectionBlue = cat(3,rm,gm,bm);
subplot(3,1,3);
imshow(FinalDetectionBlue);
title('BLUE');
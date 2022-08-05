% Giving Data Input from Saved (Hardcopy) Image
m1 = 'red.png';
im1 = imread(m1);
subplot(3,1,1);
imshow(m1);
title('User Given Image 1');

m2 ='green.png';
im2 = imread(m2);
subplot(3,1,2);
imshow(m2);
title('User Given Image 2');

m3 = 'blue.png';
im3 = imread(m3);
subplot(3,1,3);
imshow(m3);
title('User Given Image 3');
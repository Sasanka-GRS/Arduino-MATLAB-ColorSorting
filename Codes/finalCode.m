clear all              
a = arduino('COM3', 'Uno', 'Libraries', 'Servo');
s1= servo(a, 'D1');
writePosition(s1,(1/6));
s2= servo(a, 'D2');
writePosition(s2,(1/6));
s3= servo(a, 'D3');
writePosition(s3,(1/6));

imaqreset          %delete and resets image aquisition toolbox functions
info= imaqhwinfo;  %Information regarding the Adaptors 
vid= videoinput('winvideo','1', 'RGB24_320X240');  %videoinput('apaptername','device_ID','format')
set(vid, 'FramesPerTrigger', Inf);   %Specify number of frames to acquire per trigger using selected video source
set(vid, 'ReturnedColorspace', 'rgb') %Set the video input as RGB or grayscale.
vid.FrameGrabInterval = 5;      %An interval between frames, Here 5 frame interval between two frames
start(vid);                     % start
preview(vid);                   %Visualize the video
  
% Set loop from the value of slider
while(vid.FramesAcquired<=300)    % Its a loop which runs for 300 frames, It can be varied as required.

  % current snapshot
  im = getsnapshot(vid);            %To convert the live stream video into a screenshot 
  
  % Red color detection
  r = im(:,:,1); 
  g = im(:,:,2); 
  b = im(:,:,3); % r = red object g = green and b = blue objects
  
  % Red color detection
  RedPart = imsubtract(r,rgb2gray(im));
  RedPart = medfilt2(RedPart,[3 3]);
  BlackNWhite = imbinarize(RedPart,0.2);
  area_r = bwareaopen(BlackNWhite,300);
  R = sum(area_r(:));
  rm = immultiply(area_r,r);  
  gm=g.*0;  
  bm=b.*0;

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
  rm=r.*0;  
  bm=b.*0;

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
  gm=g.*0;  
  rm=r.*0;

  FinalDetectionBlue = cat(3,rm,gm,bm);
  subplot(3,1,3);
  imshow(FinalDetectionBlue);
  title('BLUE');
 
  if((R>G) && (R>B))
    disp('RED');
    writePosition(s1,(2/3));
  elseif((G>R) && (G>B))
    disp('GREEN');
    writePosition(s2,(2/3));
  elseif((B>R) && (B>G))
    disp('BLUE');  
    writePosition(s3,(2/3));                  
  else
    disp('NONE');
  end
  
  writePosition(s1,0); 
  writePosition(s2,0);
  writePosition(s3,0);
  
end
  
  %Once the program has run, the data's are cleared.
  stop(vid);                              
  delete(vid);
  clear;
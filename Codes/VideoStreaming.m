%Initially we are initialzing the Live video stream

imaqreset          %delete and resets image aquisition toolbox functions
info = imaqhwinfo;  %Information regarding the Adaptors 
vid = videoinput('winvideo','1', 'RGB24_320X240');  %videoinput('apaptername','device_ID','format')
set(vid, 'FramesPerTrigger', Inf);   %Specify number of frames to acquire per trigger using selected video source
set(vid, 'ReturnedColorspace', 'rgb') %Set the video input as RGB or grayscale.
vid.FrameGrabInterval = 5;      %An interval between frames, Here 5 frame interval between two frames
start(vid);                     % start
preview(vid);                   %Visualize the video
stop(vid);                              
delete(vid);
clear;
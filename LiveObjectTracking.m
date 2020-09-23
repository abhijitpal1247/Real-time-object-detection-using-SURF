%PRESS CTR+C TO STOP THIS CODE!!!

clear
close all

I1 = rgb2gray(imread('art.jpg'));%enter immage to be tracked
I1 = imresize(I1, 1);
points1 = detectSURFFeatures(I1);
[f1,vpts1] = extractFeatures(I1,points1);
cam=webcam;

 while 1 
     frame=snapshot(cam);
     I2=rgb2gray(frame);
     I2 = imresize(I2, 1/1.6);
     
     points2 = detectSURFFeatures(I2);
     [f2,vpts2] = extractFeatures(I2,points2);
     indexPairs = matchFeatures(f1,f2) ;
     matchedPoints1 = vpts1(indexPairs(:,1));
     matchedPoints2 = vpts2(indexPairs(:,2));
     figure(1); ax = axes;
     showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2,'montage','Parent',ax);
 end
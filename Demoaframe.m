
%% clear command windows
clc
clear all
close all
tic
%% input
v = VideoReader('normal video/overwatch.mp4');% Read the input video
frame = v.NumberOfFrames;
frame_n = 2317;%which frame
I = read(v,frame_n);
[height,width,dim] = size(I);
I2 = I;
%% face detection
%To detect Face
FDetect = vision.CascadeObjectDetector;
%Returns Bounding Box values based on number of objects
BB = step(FDetect,I2);
figure,imshow(I2); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;
facenum = i;
if facenum~=0
    facenum = i;%how much face in this picture
else
    facenum = 0;
end
%% pre
IR=I(:,:,1);IG=I(:,:,2);IB=I(:,:,3);
mIR=medfilt2(IR);
mIG=medfilt2(IG);
mIB=medfilt2(IB);
I(:,:,1)=mIR;I(:,:,2)=mIG;I(:,:,3)=mIB;
%% parameters
% kmeans parameter
K    = 6;                  % Cluster Numbers
% meanshift parameter
bw   = 0.2;                % Mean Shift Bandwidth
%% compare
%Ikm          = Km(I,K);                     % Kmeans (color)
[Ims, Nms]   = Ms(I,bw);                    % Mean Shift (color)
%% show
%figure,imshow(I);    title('Original'); 
%figure,imshow(Ikm);  title(['Kmeans',' : ',num2str(K)]);
figure,imshow(Ims);  title(['MeanShift',' : ',num2str(Nms)]); 
%% skin detection
for i=1:height
    for j=1:width
        R = Ims(i,j,1)*255;
        G = Ims(i,j,2)*255;
        B = Ims(i,j,3)*255;
        if(R > 95 && G > 40 && B > 20)
            Iv = [R,G,B];
            if((max(Iv) - min(Iv)) > 15)
                if(abs(R-G) > 15 && R > G && R > B)
                    %it is a skin
                    segment(i,j) = 1;
                end
            end
        else
            segment(i,j)=0;
        end 
    end
end
figure,imshow(segment);  title('pre skin detection');
%% continues skin detection
skinnum=0;
for i=4:height-4
    for j=4:width-4            
        if  segment(i-3,j-3)&&segment(i-3,j-2)&&segment(i-3,j-1)&&segment(i-3,j)&&segment(i-2,j-3)&&segment(i-2,j-2)&&segment(i-2,j-1)&&segment(i-2,j)&&segment(i-1,j-3)&&segment(i-1,j-2)&&segment(i-1,j-1)&&segment(i-1,j)&&segment(i,j-3)&&segment(i,j-2)&&segment(i,j-1)&&segment(i,j)
            skin_segment(i,j)=1;
            skinnum = skinnum+1;
        else       
            skin_segment(i,j)=0;    
        end    
    end
end
skinpercent = roundn(skinnum/(height*width),-4);
figure,imshow(skin_segment);  title('skin detection');
%% compute pornographic quality
if facenum>=1
    if skinpercent>=0.5
        quality=skinpercent*1.2*100;
    else
        quality=0.5*skinpercent*100;
    end
end
if facenum<1
    quality=0.5*skinpercent*100;
end
if quality<30
    quality=0;
end
if quality>80
    quality=100;
end
if quality>100
    quality=100;
end
figure,imshow(I);  title(['Pornographic quality : ',num2str(quality),'%']); 
toc
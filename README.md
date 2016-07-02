## Identify Porn Video  
NCTU computer vision final project  
  
  
### Introduce  
In many pornographic webs, it have some priority let user know how hardcore in this video.  
How to decided it in each video?  
I use mean shift algorithm to identify how much naked in a video, and give a radio.  
  
* In famous pronographic webs xvideo, it has like this application.  
![readmeimg0](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img0.png)  
  
  
###How to run it
It is matlab code, so you have use matlab to open it.  
You must have basic matlab toolbox and computer vision toolbox.  
In Demo.m you can input your /path/video_name in code.  
In Demoaframe.m you can input your /path/picture_name in code.  
like this:  
> v = VideoReader('path/video_name.mp4');% Read the input video  
  
it will output a picture(if Demo.m, it will show a highest quality frame) and pornograpic quality  
  
  
### Use Algorithm :  
Mean Shift:  Use algorithm on NCTU computer vision class.  
Identify human skin : scan every pixel and use this reference : <http://www.mathworks.com/matlabcentral/answers/43123-skin-color-detection-problem>  

Face detection: reference from : <http://angeljohnsy.blogspot.com/2013/07/face-detection-matlab-code.html> 
  
  
### Advantage :
I use mean shift algorithm and identify human skin can more powerful to classify human's skin, exclude light shad change, different skin clolor, noise...etc  
  
* A example, we can identify skin color in the same.  
![readmeimg1](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img1.png) mean shift→ ![readmeimg2](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img2.png)  
  
    
### Define "pornographic quality" :  
In this application, "pornographic quality" is means how much uncover human in video and how much naked in these human.  
  
  
### Flow :  
![readmeimg_flow](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img_flow.png)
  
  
### Resluts :  
A piceture input :  
![readmeimg3](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img3.png) face detection-> ![readmeimg4](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img4.png)  
mean shift-> ![readmeimg5](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img5.png) skin detection-> ![readmeimg6](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img6.png)  
Final, we can get original picture and a pornographic quality:  
![readmeimg7](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img7.png)  
  
  
A video input :  
![readmeimg9](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img9.png)  
it will get some video frame to do like a picture input, and get a average score.  
![readmeimg10](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img10.png)  
it is not a porn video, so it get a low quality 4.0168%  
  
  
Another example for real porn video :  
![readmeimg11](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img11.png)  
<center> ↓ </center>  
![readmeimg12](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img12.png)  
it is a porn video, it can identify a high quality 69.0166%  
  
  
### Compare with another application :  
In famous pornographic web "XVIDEO" has a dance video, it is not a pornographic video, but in Xvideo it give a high quality  
![readmeimg13](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img13.png)  
but use my applicaiton it can give a correct quality(my algorithm let lower than 25% results give a 0% quality)  
![readmeimg14](https://raw.githubusercontent.com/PohanYang/App_Identify-Porn-video/master/docs/rd_img14.png)  
  
  
Thanks for your watching, if you have any advice you can email for me <swingcowrock@gmail.com>  

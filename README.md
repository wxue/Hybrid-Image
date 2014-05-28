# Hybrid-Image

#### About

This project is based on the paper “Hybrid images(by A. Oliva, A. Torralba, P.G. Schyns)”.

> This is a small project I practiced on [Professor Hua's](http://www.cs.stevens.edu/~ghua/) 2014 Spring [Computer Vision Class ](http://www.cs.stevens.edu/~ghua/ghweb/Teaching/CS558Spring2014.htm) at Stevens Institute of Technology.

###### As mentioned in the paper “Hybrid images(by A. Oliva, A. Torralba, P.G. Schyns)”. To obtain a esthetical hybrid image, there are certain things we should concern first:

* In a hybrid image it is important that the alternative image is perceived as noise or that it blends with the dominant subband.

* Low spatial frequencies lack a precise definition of object shapes and region boundaries, which require the visual system to group the blobs together to form a meaningful interprectation of the coarse scale.

* If the image in the high spatial frequencies lacks the smae strong grouping cues, the image interpretation corresponding to the low spatial frequencies will always be available, even when viewing from a short distance.

###### Due to such a guideline and to be dramatic, here are the two pictures I choose.

![alt text](https://github.com/wxue/Hybrid-Image/tangsengnew.jpg "tangseng")

![alt text](https://github.com/wxue/Hybrid-Image/wukongnew.jpg "wukongnew")

##### Gaussian Filter:
I use fspecial() function to implement gaussian low-pass filter.
After testing, I set the thread Sigma value to 8 with hsize vector [30 30]. 
Filter result shown as follow:  

![alt text](https://github.com/wxue/Hybrid-Image/G_filtered.jpg "G_filtered")
 
##### Laplacian Filter:

Then I use fspecial() function to implement laplacian high-pass filter.
After testing, I set the thread alpha value to 0.8. 
Filter result shown as follow:

![alt text](https://github.com/wxue/Hybrid-Image/L_filtered.jpg "L_filtered")


##### Hybrid:

Take a result of 0.5 rate low frequence image hybrid with 0.8 rate high frequence image, demo as follow.

![alt text](https://github.com/wxue/Hybrid-Image/demo.jpg "demo")

   
#### Notice:

Few things need to be careful about: 

* I use double value type to store the image matrix because it always get better result than using int8. 

* Laplacian filter is a 2-D filter so we need to convert the image from rgb to hsv and use its v-dimension to do the filtering.

##### License

The MIT License (MIT)

Copyright (c) 2014 Weiyu Xue

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.